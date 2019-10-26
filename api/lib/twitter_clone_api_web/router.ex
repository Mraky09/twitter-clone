defmodule TwitterCloneApiWeb.Router do
  use TwitterCloneApiWeb, :router
  alias TwitterCloneApiWeb.SessionController

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug TwitterCloneApiWeb.Plugs.Authenticate
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through :api

    post "/sign_in", SessionController, :create
    resources "users", UserController, only: [:show]
    resources "tweets", TweetController, only: [:index, :show]
  end


  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TwitterCloneApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  scope "/sessions" do
    post "/sign_in", SessionController, :create
    delete "/sign_out", SessionController, :delete
  end
end
