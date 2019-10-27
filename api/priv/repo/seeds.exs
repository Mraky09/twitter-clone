# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TwitterCloneApi.Repo.insert!(%TwitterCloneApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TwitterCloneApi.Repo
alias TwitterCloneApi.Accounts.User

changeset = User.changeset(%User{}, %{
  user_name: "mraky09",
  email: "mraky09@gmail.com",
  password: "123456",
  first_name: "Tuan Anh",
  last_name: "Tran Nguyen"
})
Repo.insert!(changeset)
