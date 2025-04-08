defmodule TestelixirTest do
  use ExUnit.Case
  doctest Testelixir

  test "greets the world" do
    assert Testelixir.hello() == :world
  end
end
