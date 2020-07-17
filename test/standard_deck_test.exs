defmodule StandardDeckTest do
  use ExUnit.Case
  doctest StandardDeck

  test "greets the world" do
    assert StandardDeck.hello() == :world
  end
end
