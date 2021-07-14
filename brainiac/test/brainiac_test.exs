defmodule BrainiacTest do
  use ExUnit.Case
  alias Brainiac.Game
  doctest Brainiac


  test "game_loss" do
    assert :lost ==
    (1..10
    |> Enum.map(fn _ -> [1, 2, 3, 4] end)
    |> Enum.reduce(Game.new([1,2,3,5]), &Game.guess(&2, &1))
    |> Game.status)
  end

end
