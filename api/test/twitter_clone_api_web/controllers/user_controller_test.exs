defmodule TwitterCloneApiWeb.UserControllerTest do
  use TwitterCloneApiWeb.ConnCase
  alias TwitterCloneApi.Accounts
  @create_attrs %{email: "jon_snow@knownothing.gmail.com", password: "s3faw"}

  describe "show/2" do
    setup [:create_user]

    test "Responds with user infor if the user is found", %{conn: conn, user: user} do
      response =
        conn
        |> get(Routes.user_path(conn, :show, user.id))
        |> json_response(200)

      expected = %{
        "data" => %{
          "user" => %{
            "id" => user.id,
            "email" => user.email
          }
        }
      }

      assert response == expected
    end

    test "Responds with a message indicating user not found", %{conn: conn} do
      response =
        conn
        |> get(Routes.user_path(conn, :show, -1))
        |> json_response(404)

      expected = %{
        "error" => %{
          "detail" => "Not Found"
        }
      }

      assert response == expected
    end
  end

  defp create_user(_) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    {:ok, user: user}
  end
end
