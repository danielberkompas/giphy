defmodule Giphy.Config do
  @moduledoc """
  Configuration values and helpers for getting configuration values.
  """

  @doc """
  The current Giphy API key.

      config :giphy, api_key: "..."
      config :giphy, api_key: {:system, "GIPHY_API_KEY"}
  """
  def api_key do
    from_env(:giphy, :api_key)
  end

  @doc """
  A light wrapper around `Application.get_env/2`, providing automatic support for
  `{:system, "VAR"}` tuples.
  """
  def from_env(otp_app, key, default \\ nil)
  def from_env(otp_app, key, default) do
    otp_app
    |> Application.get_env(key, default)
    |> read_from_system(default)
  end

  defp read_from_system({:system, env}, default), do: System.get_env(env) || default
  defp read_from_system(value, _default), do: value
end
