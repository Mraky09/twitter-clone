defmodule TwitterCloneApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TwitterCloneApi.Repo
  alias TwitterCloneApi.Accounts.{User, AuthToken, Relationship}
  alias TwitterCloneApi.Services.Authenticator
  alias TwitterCloneApi.Tweets.Tweet

  schema "users" do
    has_many :auth_tokens, AuthToken
    has_many :tweets, Tweet
    has_many :following, Relationship, foreign_key: :follower_id
    has_many :followers, Relationship, foreign_key: :followed_id

    field :email, :string
    field :user_name, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password, :user_name, :first_name, :last_name])
    |> validate_required([:email, :password, :user_name, :first_name, :last_name])
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end

  def sign_in(email, password) do
    case Comeonin.Bcrypt.check_pass(Repo.get_by(User, email: email), password) do
      {:ok, user} ->
        token = Authenticator.generate_token(user)
        Repo.insert(Ecto.build_assoc(user, :auth_tokens, %{token: token}))

      err ->
        err
    end
  end

  def sign_out(conn) do
    case Authenticator.get_auth_token(conn) do
      {:ok, token} ->
        case Repo.get_by(AuthToken, %{token: token}) do
          nil -> {:error, :not_found}
          auth_token -> Repo.delete(auth_token)
        end

      error ->
        error
    end
  end
end
