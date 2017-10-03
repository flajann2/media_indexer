defmodule Media.Worker do
  use GenServer

  import Apex
  import IO
  
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(server) do
    {:ok, server}
  end

  def handle_call({:scan_file, file}, _from, [h | t]) do
    puts "calling #{file}"
    {:reply, h, t}
  end

  def handle_cast({:scan_file, file}, t) do
    puts "casting #{file}"
    {:noreply, [t]}
  end  
end
