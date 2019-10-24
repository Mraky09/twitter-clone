defmodule TwitterCloneApiWeb.UserController do
  use TwitterCloneApiWeb, :controller
  alias TwitterCloneApi.Accounts

  action_fallback TwitterCloneApiWeb.FallbackController

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end
end
