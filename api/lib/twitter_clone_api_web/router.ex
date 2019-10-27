defmodule TwitterCloneApiWeb.Router do
  use TwitterCloneApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug TwitterCloneApiWeb.Plugs.Authenticate
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through :api

    post "/sign_in", SessionController, :create
    resources "/users", UserController, only: [:show]
    resources "/tweets", TweetController, only: [:index, :show]
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through [:api, :api_auth]

    resources "/tweets", TweetController, only: [:create]
  end

  scope "/", TwitterCloneApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end

  scope "/sessions" do
    post "/sign_in", TwitterCloneApiWeb.SessionController, :create
  end
end
