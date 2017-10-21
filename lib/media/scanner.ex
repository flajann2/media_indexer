defmodule Media.Scanner do
  import Apex
  import IO

  def scan_and_catalog_file(file) do
    r = Sh.file(file, b: true) |> String.trim
    puts "#{r} -> #{file}"
    :ok
  end

  defp parse_file_results(s) do
    s
  end
end

