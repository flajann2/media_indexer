defmodule Media.Filer do
  use GenServer

  import Apex
  import IO
  
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :filer)
  end

  ## Callbacks
  def init(state) do
    {:ok, state}
  end

  def handle_cast() do
  end
end








