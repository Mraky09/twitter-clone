defmodule TwitterCloneApiWeb.DefaultController do
  use TwitterCloneApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Twitter Cloner API")
  end
end
