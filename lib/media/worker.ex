defmodule Media.Worker do
  use GenServer

  import Apex
  import IO
  
  alias Media.Scanner
  
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(server) do
    {:ok, server}
  end

  def handle_call({:scan_file, file}, _from, state) do
    puts "*** scan file #{file}"
    ap state
    {:reply, file, state ++ [file]}
  end

  def handle_cast({:scan_file, file}, t) do
    case Scanner.scan_and_catalog_file(file) do
      :ok -> {:noreply, [t]}
      :error -> :error
    end
  end

  @doc """
  Post the given file for scanning.
  """
  def scan_file(file) do
    GenServer.cast(__MODULE__, {:scan_file, file})
  end
end
