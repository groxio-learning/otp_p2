defmodule Brainiac.Game do
  alias Brainiac.Score

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

  defp score(move, answer) do
    pretty_score = answer
    |> Score.new(move)
    |> Score.pretty

    ~s'#{Enum.join(move , " ")} #{pretty_score}'
  end

  defp pretty_board(game) do
    game.moves
    |> Enum.map(fn move -> score(move, game.answer) end)
    |> Enum.join("\n")
  end

  defp pretty_status(game) do
    status(game)
    |> Atom.to_string
    |> String.capitalize
  end

  def pretty(game) do
    pretty_game_board = pretty_board(game)
    pretty_status = pretty_status(game)

    ~s"#{pretty_game_board}\n#{pretty_status}"
  end

end
