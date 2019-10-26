defmodule TwitterCloneApiWeb.UserView do
  use TwitterCloneApiWeb, :view

  def render("show.json", %{user: user}) do
    %{
      data: %{
        user: %{
          id: user.id,
          email: user.email
        }
      }
    }
  end
end
