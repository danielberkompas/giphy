defmodule Giphy.Page do
  @moduledoc """
  A page of image results. See the [Giphy API docs](https://github.com/Giphy/GiphyAPI)
  for more details.
  """

  defstruct total_count: 0,
            count: 0,
            offset: 0,
            data: []

  @type t :: %__MODULE__{
    total_count: integer,
    count: integer,
    offset: integer,
    data: [Giphy.GIF.t]
  }
end
