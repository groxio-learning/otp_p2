defmodule Brainiac.Score do
  defstruct [:red, :white]

  def new(answer, guess) do
    number_of_red = reds(answer, guess)
    number_of_white = whites(answer, guess, number_of_red)
    %__MODULE__{red: number_of_red, white: number_of_white}
  end

  defp reds(answer, guess) do
    Enum.zip(answer, guess) |> Enum.count(fn {x, y} -> x == y end)
  end

  defp whites(answer, guess, number_of_red) do
    Enum.count(answer) - number_of_red - misses(answer, guess)
  end

  defp misses(answer, guess) do
    (answer -- guess)
    |> Enum.count()
  end

  def pretty(%{red: red, white: white}) do
    [List.duplicate("R", red), List.duplicate("W", white)]
    |> List.flatten()
    |> Enum.join()
  end
end
