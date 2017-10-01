ExUnit.start()

{:ok, files} = File.ls("./lib")

defmodule TestEx do
  def ls_r(path) do
    cond do
      File.regular?(path) -> [path]
      File.dir?(path) ->
        File.ls!(path)
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&ls_r/1)
        |> Enum.concat
      true -> []
    end
  end

  def list_ex(path) do
    ls_r(path) |> filt_ex
  end

  defp filt_ex(ar), do: Enum.filter(ar, &(Regex.match?(~r/.*\.ex/, &1)))
end

# Enum.each TestEx.list_ex("./lib"), fn(file) ->
#   Code.require_file "#{file}"
# end
