defmodule MediaIndexer do
  @moduledoc """
  Documentation for MediaIndexer.
  """
  import Apex
  import IO

  alias Media.Actions
  alias Media.Cli
  
  def main(args) do
    args |> Cli.parse_args |> process
    loop
  end

  defp loop do
    receive do
      {:done, _code} ->
        exit(:shutdown)
      {:mess, message} ->
        puts "Message received: #{message}"        
    end
  end

  def process({[:scan], a}) do
    cache_name = a.args.cache
    scan_dirs = a.unknown
    [cache_name, scan_dirs] |> Actions.scan
  end 

  def process({[:search], a}) do
    puts "Search for"
    ap a
  end 

  def process({[:drop], a}) do
    puts "Drop"
    ap a
  end 
  
  def process({[:list], a}) do
    puts "List"
    ap a
  end 

  def process(%Optimus.ParseResult{}) do
    puts "No arguments given"
    :error
  end  
end
