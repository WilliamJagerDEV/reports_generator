defmodule ReportsGenerator.Parser do
  def parse_file(filename) do
    "reports/#{filename}"
    # retorna metadados e path do arquivo
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  def parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    # atualiza terceira posição da lista substituindo string por inteiro
    |> List.update_at(2, &String.to_integer/1)
  end
end
