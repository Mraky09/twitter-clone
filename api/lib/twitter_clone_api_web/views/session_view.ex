defmodule TwitterCloneApiWeb.SessionView do
  use TwitterCloneApiWeb, :view

  def render("show.json", auth_token) do
    %{data: %{token: auth_token.token}}
  end
end
