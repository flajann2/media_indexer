defmodule MediaIndexer do
  @moduledoc """
  Documentation for MediaIndexer.
  """

  import Apex
  import IO
  
  def main(args) do
    args |> parse_args |> process
    ap args
  end

  def process([]) do
    puts "No arguments given"
  end

  def process(options) do
    puts "Hello #{options[:name]}"
    ap options
  end

  defp parse_args(args) do
    Optimus.new!(
      name: "mediax",
      description: "Media Indexer",
      version: "0.0.1",
      author: "Fred mitchell fred.mitchell@gmx.de",
      about: "Scan all your media files and documents, index them for searching.",
      allow_unknown_args: false,
      parse_double_dash: true,
    ) |> Optimus.parse!(args)
  end
end
