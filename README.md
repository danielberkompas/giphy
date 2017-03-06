# Giphy

An Elixir wrapper around the [Giphy API](https://github.com/Giphy/GiphyAPI).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `giphy` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:giphy, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/giphy](https://hexdocs.pm/giphy).

## Configuration

Set your [Giphy API key](https://github.com/Giphy/GiphyAPI#access-and-api-keys):

```elixir
# config/config.exs
config :giphy, api_key: "API_KEY"
```

You can also read from the a system environment variable:

```elixir
config :giphy, api_key: {:system, "GIPHY_API_KEY"}
```

See the [documentation](https://hexdocs.pm/giphy) for more details.

## Usage

```elixir
iex> Giphy.search("ryan gosling", limit: 1)
{:ok,
 %Giphy.Page{count: 1,
  data: [%Giphy.GIF{bitly_gif_url: "http://gph.is/2cREAmR",
    bitly_url: "http://gph.is/2cREAmR", caption: nil, content_url: "",
    embed_url: "http://giphy.com/embed/kj8RVuDxh4x7W", id: "kj8RVuDxh4x7W",
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
    rating: "g", slug: "ryan-kj8RVuDxh4x7W",
    source: "http://www.fanpop.com/clubs/ryan-hardy-and-claire-matthews/images/34873318/title/ryan-claire-fanart",
    source_post_url: "http://www.fanpop.com/clubs/ryan-hardy-and-claire-matthews/images/34873318/title/ryan-claire-fanart",
    source_tld: "www.fanpop.com", trending_datetime: nil, type: "gif",
    url: "http://giphy.com/gifs/ryan-kj8RVuDxh4x7W", username: ""}], offset: 0,
  total_count: 20990}}
```
