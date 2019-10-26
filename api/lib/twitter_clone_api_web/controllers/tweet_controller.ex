defmodule TwitterCloneApiWeb.TweetController do
  use TwitterCloneApiWeb, :controller

  alias TwitterCloneApi.Tweets
  alias TwitterCloneApi.Tweets.Tweet

  def show(conn, _) do
  end

  def index(conn, _) do
    tweets = Tweets.list_tweets()

    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Tweets.create_tweet(conn.assigns.current_user, tweet_params) do
      conn
      |> put_status(:created)
      |> render("show.json", tweet: tweet)
    end
  end
end
