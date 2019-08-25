defmodule Extatistical.Application do
  @moduledoc false
  use Application
  import Supervisor.Spec
  require Logger

  alias Extatistical.Utils.Environments

  def start(_type, _args), do: Supervisor.start_link(children(), opts())

  defp children(), do: [
    supervisor(Extatistical.Repo, []),
    {Plug.Cowboy, scheme: :http, plug: Extatistical.Endpoint, options: get_config()}
  ]

  defp opts(), do: [
    strategy: :one_for_one,
    name: Extatistical.Supervisor
  ]

  defp get_config() do
    Logger.info("[#{__MODULE__}] Starting Extatistical application")

    with {:ok, [port: port] = config} <- Application.fetch_env(:extatistical, Extatistical.Endpoint) do
      port = Environments.get_env(port)
      Logger.info("[#{__MODULE__}] Starting server using port #{port}")
      config
    end
  end
end
