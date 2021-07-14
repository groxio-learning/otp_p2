defmodule BrainiacTest do
  use ExUnit.Case
  alias Brainiac.Game
  doctest Brainiac

  test "greets the world" do
    assert Brainiac.hello() == :world
  end

  test "new" do
    assert Game.new([1,2,3,4]) == %Game{answer: [1,2,3,4], moves: []}
  end


  test "guess" do
    game = Game.new([1,2,3,4])

    guess_one = Game.guess(game, [7,8,9,6])
    assert guess_one == %Game{answer: [1,2,3,4], moves: [[7,8,9,6]]}

    guess_two = Game.guess(guess_one, [6,5,4,3])
    assert guess_two == %Game{answer: [1,2,3,4], moves: [ [6,5,4,3], [7,8,9,6]]}

  end

  test "game flow" do

    [1,2,3,4]
    |> Game.new
    |> Game.guess([4,5,6,7])
    |> Game.guess([7,5,5,3])
    |> assert_move_count(2)
    |> Game.guess([8,9,3,2])
    |> Game.guess([6,7,5,3])
    |> Game.guess([3,4,5,6])
    |> Game.guess([6,1,2,3])
    |> assert_move_count(6)

  end

  def assert_move_count(game, count) do
    assert count == game.moves |> Enum.count
    game
  end



end
