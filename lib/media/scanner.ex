defmodule Media.Scanner do
  import Apex
  import IO

  def scan_and_catalog_file(file) do
    mimetype = Sh.file(file, b: true, i: true) |> String.trim
    fulldesc = Sh.file(file, b: true) |> String.trim
    puts "#{mimetype} <<#{fulldesc}>> -> #{file}"
    :ok
  end

  defp parse_file_results(s) do
    s
  end
end

