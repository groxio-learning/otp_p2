defmodule Abacus.Server do
  use GenServer
  alias Abacus.Counter

  def start_link(string) do
    GenServer.start_link(__MODULE__, string)
  end

  def increment(counter) do
    GenServer.cast(counter, :inc)
  end

  def read(counter) do
    GenServer.call(counter, :state)
  end

  # Callbacks

  def init(raw_state) do
    {:ok, Counter.new(raw_state)}
  end

  def handle_call(:state, _from, count) do
    {:reply, Counter.render(count), count}
  end

  def handle_cast(:inc, count) do
    {:noreply, Counter.add(count, 1)}
  end

end