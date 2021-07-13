defmodule Abacus.Server do
  use GenServer
  alias Abacus.Counter

  def start_link({initial_value, name}) do
    IO.puts("Restarting #{name}")
    GenServer.start_link(__MODULE__, initial_value, name: name)
  end

  def increment(counter \\ __MODULE__) do
    GenServer.cast(counter, :inc)
  end

  def annhilate(counter \\ __MODULE__) do
    GenServer.cast(counter, :boom)
  end

  def read(counter \\ __MODULE__) do
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

  def handle_cast(:boom, _count) do
    raise "boom"
  end

  def child_spec({initial_value, name})  do
    %{id: name, start: {__MODULE__, :start_link, [{initial_value, name}]}}
  end
end