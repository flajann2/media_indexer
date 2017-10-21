defmodule Media.Super do
  use Supervisor

  import Apex
  import IO

  alias Media.Worker

  def start_link(child_spec_list) do
    Supervisor.start_link(__MODULE__,
      [child_spec_list], name: __MODULE__)
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [supervisor(Worker, [])]
    supervise(children, strategy: :one_for_one)
  end
  
  def init(child_spec_list) do
    Process.flag(:trap_exit, true)
    children = child_spec_list |> start_children
    supervise(children, strategy: :one_for_one)
  end

  def start_children([child_spec | rest]) do
    puts "*** start_children called ***"
    case start_child(child_spec) do
      {:ok, sup} -> [sup | start_children(rest)]
      :error     -> :error
    end
  end

  def start_children([]), do: []

  def start_child({child, state}) do
    {:ok, supervisor(child, state)}
  end
end
