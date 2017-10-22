defmodule Media.Database do
  use GenServer

  import Apex
  import IO

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  
  def init(serv) do    
    {:ok, serv}
  end

  def handle_call({:query, query}, _from, state) do
    result = []
    {:reply, result, state}
  end

  def handle_cast({:upsert, data}, t) do
    {:noreply, [t]}
  end

end

