defmodule ApiRestPlugCowboyTest do
  use ExUnit.Case
  doctest ApiRestPlugCowboy

  test "greets the world" do
    assert ApiRestPlugCowboy.hello() == :world
  end
end
