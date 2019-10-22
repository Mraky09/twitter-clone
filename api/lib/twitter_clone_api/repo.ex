defmodule TwitterCloneApi.Repo do
  use Ecto.Repo,
    otp_app: :twitter_clone_api,
    adapter: Ecto.Adapters.Postgres
end
