defmodule Brainiac.Game do

  defstruct [:moves, :answer]

  def new(answer) do
    %__MODULE__{answer: answer, moves: []} # how to create struct with Game
  end

  def guess(%__MODULE__{} = game, move) do
    %{game | moves: [move | game.moves]}
  end

  # playing, won, or lose status is generated here
  # lose = 10 games & guess != answer
  # win = <= 10 games & guess == answer
  # playing == not win || not loss
  def status(game) do
    cond do
      game.answer == hd(game.moves) ->
        :win
      Enum.count(game.moves) >= 10 ->
        :lost
      true ->
        :playing
    end
  end
end
