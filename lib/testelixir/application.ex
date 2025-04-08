defmodule Testelixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TestelixirWeb.Telemetry,
      Testelixir.Repo,
      {DNSCluster, query: Application.get_env(:testelixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Testelixir.PubSub},
      # Start to serve requests
      TestelixirWeb.Endpoint,
      # Start Absinthe subscription (after Endpoint)
      {Absinthe.Subscription, TestelixirWeb.Endpoint}
      # Start a worker by calling: Testelixir.Worker.start_link(arg)
      # {Testelixir.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testelixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestelixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
