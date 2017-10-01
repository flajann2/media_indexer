defmodule MediaIndexerTest do
  use ExUnit.Case
  doctest MediaIndexer

  test "main with no parameters" do
    assert MediaIndexer.main([]) == :error
  end
end
