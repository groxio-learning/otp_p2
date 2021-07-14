defmodule Brainiac.Game do

  defstruct [:moves, :answer]

  def new(answer) do
    %__MODULE__{answer: answer, moves: []} # how to create struct with Game
  end

  def guess(%__MODULE__{} = game, move) do
    %{game | moves: [move | game.moves]}
  end


end
