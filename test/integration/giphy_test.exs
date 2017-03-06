defmodule Giphy.IntegrationTest do
  use ExUnit.Case

  @moduletag :integration

  setup do
    # Hit the real API with HTTP requests
    Application.put_env(:giphy, :api, Giphy.API.HTTP)
  end

  describe ".search" do
    test "returns results for 'ryan gosling'" do
      {:ok, page} = Giphy.search("ryan gosling", limit: 1)

      assert page.__struct__ == Giphy.Page
      assert [gif] = page.data
      assert gif.__struct__ == Giphy.GIF
    end

    test "handles invalid API keys" do
      with_invalid_key fn ->
        {:error, error} = Giphy.search("ryan gosling", limit: 1)

        assert error.__struct__ == Giphy.ConfigError
        assert error.message =~ "invalid"
      end
    end
  end

  describe ".search!" do
    test "returns results for 'ryan gosling'" do
      assert %Giphy.Page{} = Giphy.search!("ryan gosling", limit: 1)
    end

    test "raises errors" do
      with_invalid_key fn ->
        assert_raise Giphy.ConfigError, fn ->
          Giphy.search!("ryan gosling", limit: 1)
        end
      end
    end
  end

  defp with_invalid_key(fun) do
    key = Giphy.Config.api_key()
    Application.put_env(:giphy, :api_key, "totallyinvalidkey")
    fun.()
    Application.put_env(:giphy, :api_key, key)
  end
end
