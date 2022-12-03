defmodule ReportsGenerator do
  # ReportsGenerator.build("report_test.csv")

  # def build(filename) do
  #   case File.read("reports/#{filename}") do
  #     {:ok, result} -> result
  #     {:error, reason} -> reason
  #   end
  # end

  def build(filename) do
    "reports/#{filename}"
    # retorna metadados e path do arquivo
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, report ->
      [id, _food_name, price] = parse_line(line)
      Map.put(report, id, report[id] + price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    # atualiza terceira posição da lista substituindo string por inteiro
    |> List.update_at(2, &String.to_integer/1)
  end

  # cria um map com chaves de 1 a 30 para o .csv completo
  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
