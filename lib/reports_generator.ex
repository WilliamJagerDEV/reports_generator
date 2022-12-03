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
    |> File.read()
    |> handle_build()
  end

  defp handle_build({:ok, result}) do
    result
  end

  defp handle_build({:error, _reason}), do: {:error, "Invalid file name."}
end
