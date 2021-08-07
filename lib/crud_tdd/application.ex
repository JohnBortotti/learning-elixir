defmodule CrudTdd.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CrudTdd.Repo,
      # Start the Telemetry supervisor
      CrudTddWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrudTdd.PubSub},
      # Start the Endpoint (http/https)
      CrudTddWeb.Endpoint
      # Start a worker by calling: CrudTdd.Worker.start_link(arg)
      # {CrudTdd.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrudTdd.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrudTddWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
