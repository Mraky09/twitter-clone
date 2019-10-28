defmodule TwitterCloneApiWeb.RelationshipController do
  use TwitterCloneApiWeb, :controller

  alias TwitterCloneApi.Accounts
  alias TwitterCloneApi.Accounts.Relationship

  action_fallback TwitterCloneApiWeb.FallbackController

  def index(conn, _) do
    relationships = Accounts.list_relationships()

    render(conn, "index.json", relationships: relationships)
  end

  def create(conn, %{"user_id" => user_id}) do
    relationship_params = %{
      "follower_id" => conn.assigns.current_user.id,
      "followed_id" => user_id
    }

    with {:ok, %Relationship{} = relationship} <- Accounts.follow(relationship_params) do
      conn
      |> put_status(:created)
      |> render("show,json", relationship: relationship)
    end
  end

  def delete(conn, %{"user_id" => id}) do
    relationship = Accounts.get_relationship_by_follower_followed_id!(conn.assigns.current_user.id, id)

    with {:ok, %Relationship{}} <- Accounts.unfollow(relationship) do
      conn
      |> put_status(:no_content)
    end
  end
end
