defmodule Giphy.GIF do
  @moduledoc """
  Represents a GIF in Giphy's library.

      %Giphy.GIF{
        bitly_gif_url: "http://gph.is/2cREAmR",
        bitly_url: "http://gph.is/2cREAmR", 
        caption: nil, 
        content_url: "",
        embed_url: "http://giphy.com/embed/kj8RVuDxh4x7W", 
        id: "kj8RVuDxh4x7W",
        images: %{"downsized" => %{"height" => "282", "size" => "815916",
            "url" => "http://media1.giphy.com/media/kj8RVuDxh4x7W/giphy-downsized.gif",
            "width" => "500"},
          "downsized_large" => %{"height" => "282", "size" => "815916",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy.gif",
            "width" => "500"},
          "downsized_medium" => %{"height" => "282", "size" => "815916",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy.gif",
            "width" => "500"},
          "downsized_small" => %{"mp4" => "http://media1.giphy.com/media/kj8RVuDxh4x7W/giphy-downsized-small.mp4",
            "mp4_size" => "108435"},
          "downsized_still" => %{"height" => "282", "size" => "34895",
            "url" => "http://media1.giphy.com/media/kj8RVuDxh4x7W/giphy-downsized_s.gif",
            "width" => "500"},
          "fixed_height" => %{"height" => "200",
            "mp4" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200.mp4",
            "mp4_size" => "53787", "size" => "691026",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200.webp",
            "webp_size" => "181166", "width" => "355"},
          "fixed_height_downsampled" => %{"height" => "200", "size" => "186087",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200_d.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200_d.webp",
            "webp_size" => "45472", "width" => "355"},
          "fixed_height_small" => %{"height" => "100",
            "mp4" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100.mp4",
            "mp4_size" => "21509", "size" => "231986",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100.webp",
            "webp_size" => "74658", "width" => "177"},
          "fixed_height_small_still" => %{"height" => "100",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100_s.gif",
            "width" => "177"},
          "fixed_height_still" => %{"height" => "200",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200_s.gif",
            "width" => "355"},
          "fixed_width" => %{"height" => "113",
            "mp4" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w.mp4",
            "mp4_size" => "23726", "size" => "277260",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w.webp",
            "webp_size" => "89376", "width" => "200"},
          "fixed_width_downsampled" => %{"height" => "113", "size" => "75018",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w_d.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w_d.webp",
            "webp_size" => "22302", "width" => "200"},
          "fixed_width_small" => %{"height" => "56",
            "mp4" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100w.mp4",
            "mp4_size" => "10396", "size" => "86179",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100w.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100w.webp",
            "webp_size" => "37204", "width" => "100"},
          "fixed_width_small_still" => %{"height" => "56",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/100w_s.gif",
            "width" => "100"},
          "fixed_width_still" => %{"height" => "113",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/200w_s.gif",
            "width" => "200"},
          "looping" => %{"mp4" => "http://media.giphy.com/media/kj8RVuDxh4x7W/giphy-loop.mp4"},
          "original" => %{"frames" => "24", "height" => "282",
            "mp4" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy.mp4",
            "mp4_size" => "86577", "size" => "815916",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy.gif",
            "webp" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy.webp",
            "webp_size" => "316792", "width" => "500"},
          "original_still" => %{"height" => "282",
            "url" => "http://media4.giphy.com/media/kj8RVuDxh4x7W/giphy_s.gif",
            "width" => "500"},
          "preview" => %{"height" => "214",
            "mp4" => "http://media1.giphy.com/media/kj8RVuDxh4x7W/giphy-preview.mp4",
            "mp4_size" => "45015", "width" => "380"},
          "preview_gif" => %{"height" => "69", "size" => "46680",
            "url" => "http://media1.giphy.com/media/kj8RVuDxh4x7W/giphy-preview.gif",
            "width" => "122"}}, import_datetime: ~N[2016-09-21 21:57:01],
        rating: "g", 
        slug: "ryan-kj8RVuDxh4x7W",
        source: "http://www.fanpop.com/clubs/ryan-hardy-and-claire-matthews/images/34873318/title/ryan-claire-fanart",
        source_post_url: "http://www.fanpop.com/clubs/ryan-hardy-and-claire-matthews/images/34873318/title/ryan-claire-fanart",
        source_tld: "www.fanpop.com", 
        trending_datetime: nil, 
        type: "gif",
        url: "http://giphy.com/gifs/ryan-kj8RVuDxh4x7W", 
        username: ""
      } 
  """

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
