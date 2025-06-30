defmodule AttendanceApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AttendanceAppWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:attendance_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AttendanceApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AttendanceApp.Finch},
      # Start a worker by calling: AttendanceApp.Worker.start_link(arg)
      # {AttendanceApp.Worker, arg},
      # Start to serve requests, typically the last entry
      AttendanceAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AttendanceApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AttendanceAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
