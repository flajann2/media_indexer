defmodule Media.Super do
  use Supervisor

  import Apex
  import IO

  alias Media.Worker

  def start_link(child_spec_list) do
    Supervisor.start_link(__MODULE__, [child_spec_list], name: __MODULE__)
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [supervisor(Worker, [])]
    supervise(children, strategy: :one_for_one)
  end
  
  def init([child_spec_list]) do
    Process.flag(:trap_exit, true)
    state = child_spec_list |> start_children |> Enum.into(HashDict.new)
    {:ok, state}
  end

  def start_children([child_spec | rest]) do
    puts "start_children called"
    case start_child(child_spec) do
      {:ok, pid} -> [{pid, child_spec} | start_children(rest)]
      :error     -> :error
    end
  end

  def start_children([]), do: []

  def start_child({child, state}) do
    ch = [supervisor(child, state)]
    supervise(ch, strategy: :one_for_one)
  end
end
