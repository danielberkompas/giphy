defmodule Giphy.ConfigError do
  defexception [:message]

  def exception(:invalid_api_key) do
    %__MODULE__{
      message: """
      API key #{inspect(Giphy.Config.api_key())} is invalid.

      Request a key from Giphy at http://api.giphy.com/submit, or use the
      public beta key:

          config :giphy, api_key: "dc6zaTOxFJmzC"
      """
    }
  end
end

