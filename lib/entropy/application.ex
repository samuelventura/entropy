defmodule Entropy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EntropyWeb.Telemetry,
      Entropy.Repo,
      {DNSCluster, query: Application.get_env(:entropy, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Entropy.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Entropy.Finch},
      # Start a worker by calling: Entropy.Worker.start_link(arg)
      # {Entropy.Worker, arg},
      # Start to serve requests, typically the last entry
      EntropyWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Entropy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EntropyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
