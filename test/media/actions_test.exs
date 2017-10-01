defmodule Media.ActionsTest do
  use ExUnit.Case
  doctest Media.Actions

  test "dir_tree should return a tree list" do
    assert {".", a} = Media.Actions.dir_tree
    assert length(a) > 0
  end
end

