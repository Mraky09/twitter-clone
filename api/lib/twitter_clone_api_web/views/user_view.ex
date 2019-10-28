defmodule TwitterCloneApiWeb.UserView do
  use TwitterCloneApiWeb, :view

  def render("show.json", %{user: user}) do
    %{
      data: %{
        user: %{
          id: user.id,
          email: user.email,
          user_name: user.user_name,
          first_name: user.first_name,
          last_name: user.last_name,
        }
      }
    }
  end
end
