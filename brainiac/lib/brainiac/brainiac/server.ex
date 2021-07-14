defmodule Brainiac.Server do
  use GenServer
  alias Brainiac.Game

  # # Callbacks
  # def start_link({initial_value, name}) do
  #   GenServer.start_link(__MODULE__, initial_value, name: name)
  # end

  # new
  def init(_) do
    {:ok, Game.new(1..8 |> Enum.shuffle |> Enum.take(4))}
  end

  # guess
  # use pretty
  def handle_call({:move, cur_guess}, _from, game) do
    new_game = game
    |> Game.guess(cur_guess)
    {:reply, Game.pretty(new_game), new_game}

    # 1..10
    # |> Enum.map(fn _ -> [1, 2, 3, 4] end)
    # |> Enum.reduce(Game.new([1,2,3,5]), &Game.guess(&2, &1))
    # |> Game.status
  end

end
