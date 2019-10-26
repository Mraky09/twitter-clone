defmodule TwitterCloneApi.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset
  alias TwitterCloneApi.Accounts.User

  schema "tweets" do
    field :content, :string, null: false
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
