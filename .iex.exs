# This is executed when iex is run in this directory.

IO.puts "\nmedia-indexer project"

import Apex
import IO

defmodule R do
  def reload! do
    Mix.Task.reenable "compile.elixir"
    Application.stop(Mix.Project.config[:app])
    Mix.Task.run "compile.elixir"
    Application.start(Mix.Project.config[:app], :permanent)
  end
end
