defmodule Giphy.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    validate_config!()

    children = [
      # Custom Hackney pool for requests
      :hackney_pool.child_spec(:giphy, [timeout: 15000, max_connections: 100])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Giphy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp validate_config! do
    unless Giphy.Config.api_key() do
      raise Giphy.ConfigError.exception(:invalid_api_key)
    end
  end
end
