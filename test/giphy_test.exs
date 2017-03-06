defmodule GiphyTest do
  use ExUnit.Case

  setup do
    # Hit the mock API without HTTP
    Application.put_env(:giphy, :api, Giphy.API.Mock)
  end

  describe ".search" do
    test "returns a `Giphy.Page`" do
      {:ok, page} = Giphy.search("valid")

      assert page.__struct__ == Giphy.Page
      assert [gif] = page.data
      assert gif.__struct__ == Giphy.GIF
    end

    test "returns unsuccessful responses" do
      {:error, response} = Giphy.search("not_found")

      assert response.__struct__ == HTTPoison.Response
      assert response.status_code == 404
    end

    test "returns HTTPoison errors" do
      {:error, error} = Giphy.search("error")
      assert error.__struct__ == HTTPoison.Error
    end

    test "returns invalid API key errors" do
      {:error, error} = Giphy.search("invalid_api_key")
      assert error.__struct__ == Giphy.ConfigError
      assert error.message =~ "invalid"
    end
  end

  describe ".search!" do
    test "returns Giphy.Page on success" do
      assert %Giphy.Page{} = Giphy.search!("valid")
    end

    test "raises Giphy.SearchError on unsuccessful request" do
      assert_raise Giphy.SearchError, fn ->
        Giphy.search!("not_found")
      end
    end

    test "raises HTTPoison.Errors" do
      assert_raise HTTPoison.Error, fn ->
        Giphy.search!("error")
      end
    end
  end
end
