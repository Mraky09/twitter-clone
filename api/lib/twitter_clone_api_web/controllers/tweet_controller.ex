defmodule TwitterCloneApiWeb.TweetController do
  use TwitterCloneApiWeb, :controller

  alias TwitterCloneApi.Tweets

  def show(conn, _) do
  end

  def index(conn, _) do
    tweets = Tweets.list_tweets()

    render(conn, "index.json", tweets: tweets)
  end
end
