defmodule TwitterCloneApiWeb.UserController do
  use TwitterCloneApiWeb, :controller
  alias TwitterCloneApi.Accounts

  action_fallback TwitterCloneApiWeb.FallbackController

  def show(conn, %{"user_name" => user_name}) do
    user = Accounts.get_user_by_user_name!(user_name)
    render(conn, "show.json", user: user)
  end
end
