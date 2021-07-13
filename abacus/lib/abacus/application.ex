defmodule Abacus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting")
    children = [
      # Starts a worker by calling: Abacus.Worker.start_link(arg)
       {Abacus.Server, {"42", :aniket}},
       {Abacus.Server, {"84", :shah}},
       {Abacus.Server, {"43", :bruce}},
       {Abacus.Server, {"13", :stephen}},
       {Abacus.Server, {"22", :prabhakar}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Abacus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
