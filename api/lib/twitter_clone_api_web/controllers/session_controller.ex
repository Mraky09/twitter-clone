defmodule TwitterCloneApiWeb.SessionController do
  use TwitterCloneApiWeb, :controller
  alias TwitterCloneApi.Accounts.User

  def create(conn, %{"email" => email, "password" => password}) do
    case User.sign_in(email, password) do
      {:ok, auth_token} ->
        conn
        |> put_status(:ok)
        |> render("show.json", auth_token)

      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> put_view(TwitterCloneApiWeb.ErrorView)
        |> render("401.json", message: message)
    end
  end

  def delete(conn, _) do
    case User.sign_out(conn) do
      {:error, reason} -> conn |> send_resp(400, reason)
      {:ok, _} -> conn |> send_resp(204, "")
    end
  end
end
