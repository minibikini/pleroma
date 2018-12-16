defmodule Pleroma.Captcha.Kocaptcha do
  alias Pleroma.Captcha.Service
  @behaviour Service

  @ets __MODULE__.Ets

  @impl Service
  def new() do
    endpoint = Pleroma.Config.get!([__MODULE__, :endpoint])

    case Tesla.get(endpoint <> "/new") do
      {:error, _} ->
        %{error: "Kocaptcha service unavailable"}

      {:ok, res} ->
        json_resp = Poison.decode!(res.body)

        token = json_resp["token"]

        true = :ets.insert(@ets, {token, json_resp["md5"]})

        %{type: :kocaptcha, token: token, url: endpoint <> json_resp["url"]}
    end
  end

  @impl Service
  def validate(token, captcha) do
    with false <- is_nil(captcha),
         [{^token, saved_md5}] <- :ets.lookup(@ets, token),
         true <- :crypto.hash(:md5, captcha) |> Base.encode16() == String.upcase(saved_md5) do
      # Clear the saved value
      cleanup(token)

      true
    else
      _ -> false
    end
  end

  @impl Service
  def cleanup(token) do
    # Only delete the entry if it exists in the table, because ets:delete raises an exception if it does not
    case :ets.lookup(@ets, token) do
      [{^token, _}] -> :ets.delete(@ets, token)
      _ -> true
    end
  end
end
