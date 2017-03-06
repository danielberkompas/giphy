defmodule Giphy.API.Mock do
  @moduledoc """
  A mock version of the `Giphy.API` for use in tests. Use it instead of
  `Giphy.API.HTTP` in your tests:

      # config/test.exs
      config :giphy, api: Giphy.API.Mock

  If this mock does not suit your needs, define your own and use it instead:

      defmodule MyApp.Giphy.Mock do
        @behaviour Giphy.API

        def get("/search", _headers, [params: params]) do
          # ...
        end
      end

      # In your config/test.exs:
      config :giphy, api: MyApp.Giphy.Mock
  """

  @behaviour Giphy.API

  @doc """
  Perform a mock search.

  Supports the following search terms:

  - "invalid_api_key": Returns an unauthorized `HTTPoison.Response`.
  - "error": Returns an `HTTPoison.Error`.
  - "valid": Returns a single GIF result.
  """
  def get("/search", _headers, [params: params]) do
    do_search(params[:q])
  end

  def do_search("invalid_api_key") do
    {:ok, 
      %HTTPoison.Response{
        status_code: 401,
        body: %{
          "meta" => %{
            "error_code" => "invalid_api_key",
            "msg" => "Unauthorized", 
            "response_id" => "58bda0d166b42628dda57aed",
            "status" => 401
          }
        }
      }
    }
  end

  def do_search("not_found") do
    {:ok,
     %HTTPoison.Response{
       status_code: 404,
       body: %{
        "meta" => %{
          "error_code" => "not_found",
          "msg" => "Not Found",
          "status" => 404
        }
       }
     }}
  end

  def do_search("error") do
    {:error, %HTTPoison.Error{reason: "Something bad happened!"}}
  end

  def do_search("valid") do
    {:ok, 
      %HTTPoison.Response{
        status_code: 200,
        body: %{
          "data" => [%Giphy.GIF{
            type: "gif",
            id: "FiGiRei2ICzzG",
            slug: "funny-cat-FiGiRei2ICzzG",
            url: "http://giphy.com/gifs/funny-cat-FiGiRei2ICzzG",
            bitly_gif_url: "http://gph.is/1fIdLOl",
            bitly_url: "http://gph.is/1fIdLOl",
            embed_url: "http://giphy.com/embed/FiGiRei2ICzzG",
            username: "",
            source: "http://tumblr.com",
            rating: "g",
            caption: "",
            content_url: "",
            source_tld: "tumblr.com",
            source_post_url: "http://tumblr.com",
            import_datetime: ~N[2014-01-18 09:14:20],
            trending_datetime: ~N[1970-01-01 00:00:00],
            images: %{
              "fixed_height" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200.gif",
                "width" => "568",
                "height" => "200",
                "size" => "460622",
                "mp4" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200.mp4",
                "mp4_size" => "13866",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200.webp",
                "webp_size" => "367786"
              },
              "fixed_height_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200_s.gif",
                "width" => "568",
                "height" => "200"
              },
              "fixed_height_downsampled" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200_d.gif",
                "width" => "568",
                "height" => "200",
                "size" => "476276",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200_d.webp",
                "webp_size" => "100890"
              },
              "fixed_width" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w.gif",
                "width" => "200",
                "height" => "70",
                "size" => "90483",
                "mp4" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w.mp4",
                "mp4_size" => "14238",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w.webp",
                "webp_size" => "47302"
              },
              "fixed_width_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w_s.gif",
                "width" => "200",
                "height" => "70"
              },
              "fixed_width_downsampled" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w_d.gif",
                "width" => "200",
                "height" => "70",
                "size" => "71069",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/200w_d.webp",
                "webp_size" => "13186"
              },
              "fixed_height_small" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100.gif",
                "width" => "284",
                "height" => "100",
                "size" => "460622",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100.webp",
                "webp_size" => "72748"
              },
              "fixed_height_small_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100_s.gif",
                "width" => "284",
                "height" => "100"
              },
              "fixed_width_small" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100w.gif",
                "width" => "100",
                "height" => "35",
                "size" => "90483",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100w.webp",
                "webp_size" => "18298"
              },
              "fixed_width_small_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/100w_s.gif",
                "width" => "100",
                "height" => "35"
              },
              "downsized" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy.gif",
                "width" => "500",
                "height" => "176",
                "size" => "426811"
              },
              "downsized_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy_s.gif",
                "width" => "500",
                "height" => "176"
              },
              "downsized_large" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy.gif",
                "width" => "500",
                "height" => "176",
                "size" => "426811"
              },
              "original" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy.gif",
                "width" => "500",
                "height" => "176",
                "size" => "426811",
                "frames" => "22",
                "mp4" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy.mp4",
                "mp4_size" => "51432",
                "webp" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy.webp",
                "webp_size" => "291616"
              },
              "original_still" => %{
                "url" => "http://media2.giphy.com/media/FiGiRei2ICzzG/giphy_s.gif",
                "width" => "500",
                "height" => "176"
              }
            }
          }],
          "pagination" => %{ 
            "total_count" => 1947,
            "count" => 1,
            "offset" => 0
          },
        }
      }}
  end
end
