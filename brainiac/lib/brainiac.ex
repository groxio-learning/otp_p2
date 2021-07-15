defmodule Brainiac do
  def start_game(name) do
    {:ok, _} = DynamicSupervisor.start_child(Brainiac.DynamicSupervisor, {Brainiac.Server, name})
  end

  def maybe_end_game(_name, :playing), do: :ok

  def maybe_end_game(name, _) do
    DynamicSupervisor.terminate_child(Brainiac.DynamicSupervisor, GenServer.whereis(name))
  end

  def guess(name, guess) do
    result = Brainiac.Server.guess(name, guess)
    IO.puts(result.pretty)
    maybe_end_game(name, result.status)
  end
end
