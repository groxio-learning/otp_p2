defmodule Brainiac do

  def start_game(name) do
    {:ok, _} = DynamicSupervisor.start_child(Brainiac.DynamicSupervisor, {Brainiac.Server, name})
  end

  def guess(name, guess) do
    Brainiac.Server.guess(name, guess)
  end
end
