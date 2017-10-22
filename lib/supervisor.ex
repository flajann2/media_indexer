defmodule MediaApp.Supervisor do
  use Supervisor

  alias Media.{Worker, Super, Database}
  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children =
      [
        supervisor(Super, [[{Worker, []},
                            {Database, []}]]),
      ]
    supervise(children, strategy: :one_for_one)
  end
end
