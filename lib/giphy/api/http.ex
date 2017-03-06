defmodule Giphy.API.HTTP do
  @moduledoc """
  An HTTP implementation of `Giphy.API` for use in development and production.
  Makes real HTTP requests to the Giphy API.

  For the mock version, see `Giphy.API.Mock`.
  """

  @behaviour Giphy.API

  use HTTPoison.Base

  def process_url(url) do
    "http://api.giphy.com/v1/gifs" <> url
  end

  def process_request_options(options) do
    Keyword.update options, :params, [], fn(params) ->
      [{"api_key", Giphy.Config.api_key()} | params]
    end
  end

  def process_response_body(body) do
    Poison.decode!(body, as: %{"data" => [%Giphy.GIF{}]})
  end
end
