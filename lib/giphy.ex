defmodule Giphy do
  @moduledoc """
  An Elixir wrapper for the [Giphy API](https://github.com/Giphy/GiphyAPI).

  ## Configuration

  You will need to set the Giphy API key. The `:api_key` config option accepts
  both a `String` and a `{:system, "ENV_VAR"}` tuple.

      config :giphy, api_key: {:system, "ENV_VAR"}

  ## Usage
  
  Simply search for whatever GIF you want to find with `Giphy.search/2`:

      Giphy.search("ryan gosling")
      # => %Giphy.Page{data: [%Giphy.GIF{}, ...]}
  
  Search results are paginated. You can pass `limit` and `offset` parameters:

      Giphy.search("ryan gosling", limit: 1, offset: 10)
      # => %Giphy.Page{data: [%Giphy.GIF{}, ...]}
  
  More documentation on the structs is located here:

  - `Giphy.Page`
  - `Giphy.GIF`

  ## Testing

  This library includes a mock API module for testing purposes. In your
  `config/text.exs`, set Giphy to use the mock:

      ```
      config :giphy, api: Giphy.API.Mock
      ```

  Your tests will then use the mock instead of making HTTP requests. See 
  `Giphy.API.Mock` for more information.
  """

  @type search_opts :: [limit: integer, offset: integer]

  @doc """
  Searches for GIFs matching a given search term. Wraps the
  [Giphy search endpoint](https://github.com/Giphy/GiphyAPI#search-endpoint).

  ## Example
  
      Giphy.search("ryan gosling")
      # => {:ok, %Giphy.Page{data: [%Giphy.Image{}]}}

  Limit and offset parameters can also be passed:

      Giphy.search("ryan gosling", limit: 1, offset: 10)
      # => {:error, %Giphy.Page{data: [%Giphy.Image{}]}}
  """
  @spec search(String.t, search_opts) :: 
    {:ok, Giphy.Page.t} | 
    {:error, HTTPoison.Response.t} |
    {:error, HTTPoison.Error.t}
  def search(terms, params \\ []) do
    api = get_api_module()
    terms = URI.encode(terms)

    case api.get("/search", [], [params: [{:q, terms}|params]]) do
      {:ok, %{status_code: 200, body: body}} ->
        page =
          %Giphy.Page{
            total_count: body["pagination"]["total_count"],
            count: body["pagination"]["count"],
            offset: body["pagination"]["offset"],
            data: body["data"]
          }

        {:ok, page}
      {:ok, %{status_code: 401}} ->
        {:error, Giphy.ConfigError.exception(:invalid_api_key)}
      {:ok, response} ->
        {:error, response}
      {:error, error} -> 
        {:error, error}
    end
  end

  @doc """
  Behaves exactly the same as `search/2`, but returns a `Giphy.Page` on success
  and raises any errors.
  """
  @spec search!(String.t, search_opts) :: Giphy.Page.t
  def search!(terms, params \\ []) do
    case search(terms, params) do
      {:ok, page} -> 
        page
      {:error, %HTTPoison.Response{} = response} ->
        raise Giphy.SearchError.exception(response)
      {:error, error} -> 
        raise error
    end
  end

  defp get_api_module do
    Application.get_env(:giphy, :api) || Giphy.API.HTTP
  end
end
