defmodule GhTlsTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    # ensures all migrations have been run on application start

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ambry.Supervisor]
    Supervisor.start_link(children(), opts)
  end

  defp children do
    []
  end
end
