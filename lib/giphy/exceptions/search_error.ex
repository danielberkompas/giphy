defmodule Giphy.SearchError do
  defexception [:message]

  def exception(response) do
    %__MODULE__{message: """
    Giphy API responded with status code #{response.status_code} and body:

      #{inspect(response.body)}
    """}
  end
end
