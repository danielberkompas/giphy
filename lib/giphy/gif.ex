defmodule Giphy.GIF do
  @derive [Poison.Decoder]

  defstruct type: "gif",
            id: nil,
            slug: nil,
            url: nil,
            bitly_gif_url: nil,
            bitly_url: nil,
            embed_url: nil,
            username: nil,
            source: nil,
            rating: nil,
            caption: nil,
            content_url: nil,
            source_tld: nil,
            source_post_url: nil,
            import_datetime: nil,
            trending_datetime: nil,
            images: %{}

  @type t :: %__MODULE__{
    type: String.t,
    id: String.t,
    slug: String.t,
    url: String.t,
    bitly_gif_url: String.t | nil,
    bitly_url: String.t | nil,
    embed_url: String.t | nil,
    username: String.t | nil,
    source: String.t | nil,
    rating: String.t | nil,
    caption: String.t | nil,
    content_url: String.t | nil,
    source_tld: String.t | nil,
    source_post_url: String.t | nil,
    import_datetime: NaiveDateTime.t | nil,
    trending_datetime: NaiveDateTime.t | nil,
    images: []
  }
end

defimpl Poison.Decoder, for: Giphy.GIF do
  def decode(value, _options) do
    value
    |> Map.put(:import_datetime, datetime(value.import_datetime))
    |> Map.put(:trending_datetime, datetime(value.trending_datetime))
  end

  # Giphy returns a blank datetime for `trending_datetime` when the gif
  # has never been trending. This is better represented with `nil`.
  defp datetime("0000-00-00 00:00:00") do
    nil
  end
  defp datetime(string) do
    [date, time] = String.split(string)
    date = Calendar.Date.Parse.iso8601!(date)
    time = Calendar.Time.Parse.iso8601!(time)
    {:ok, datetime} = NaiveDateTime.new(date, time)
    datetime
  end
end
