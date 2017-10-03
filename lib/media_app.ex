defmodule MediaApp do
  use Application

  def start(_type, _args) do
    MediaApp.Supervisor.start_link
  end
end
