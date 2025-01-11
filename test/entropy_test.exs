defmodule EntropyTest do
  use ExUnit.Case
  doctest Entropy

  test "greets the world" do
    assert Entropy.hello() == :world
  end
end
