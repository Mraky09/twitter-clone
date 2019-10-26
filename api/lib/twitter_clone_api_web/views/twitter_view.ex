defmodule TwitterCloneApiWeb.TweetView do
  use TwitterCloneApiWeb, :view
  alias TwitterCloneApiWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{
      data: %{
        tweet: %{
          id: tweet.id,
          content: tweet.content
        }
      }
    }
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{
      id: tweet.id,
      content: tweet.content,
      user: %{
        id: tweet.user_id,
        email: tweet.user.email
      },
      created_at: tweet.inserted_at
    }
  end
end
