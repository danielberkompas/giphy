defmodule Giphy.API do
  @moduledoc false

  @callback get(String.t, list, Keyword.t) :: 
    {:ok, %{body: map}} |
    {:error, HTTPoison.Error.t}
end
