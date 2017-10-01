defmodule Media.Super do
  use GenServer

  def start_link(child_spec_list) do
    GenServer.start_link(__MODULE__, [child_spec_list])
  end
  
  def init([child_spec_list]) do
    Process.flag(:trap_exit, true)
    state = child_spec_list |> start_children |> Enum.into(HashDict.new)
    {:ok, state}
  end

  def start_children([child_spec | rest]) do
    case start_child(child_spec) do
      {:ok, pid} -> [{pid, child_spec} | start_children(rest)]
      :error     -> :error
    end
  end

  def start_children([]), do: []

  def start_child(_) do
  end
end

