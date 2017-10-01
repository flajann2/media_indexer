defmodule Media.CliTest do
  use ExUnit.Case
  doctest Media.Cli

  test "parse_args with :scan" do
    assert {[:scan], _a} = Media.Cli.parse_args(["scan", "foo"])
  end
end
