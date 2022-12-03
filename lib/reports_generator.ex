defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  # def build(filename) do
  #   case File.read("reports/#{filename}") do
  #     {:ok, result} -> result
  #     {:error, reason} -> reason
  #   end
  # end

  # ReportsGenerator.build("report_complete.csv")
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  # cria um map com chaves de 1 a 30 para o .csv completo
  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  # capturando maior valor do mapa pela chave
  def fetch_higher_cost(report), do: Enum.max_by(report, fn {_key, value} -> value end)
end
