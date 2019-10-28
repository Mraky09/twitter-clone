defmodule TwitterCloneApiWeb.RelationshipView do
  use TwitterCloneApiWeb, :view

  def render("show.json", %{relationship: relationship}) do
    %{
      data: %{
        id: relationship.id,
        follower_id: relationship.follower_id,
        followed_id: relationship.followed_id,
        created_at: relationship.inserted_at
      }
    }
  end
end
