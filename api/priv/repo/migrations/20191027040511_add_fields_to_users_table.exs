defmodule TwitterCloneApi.Repo.Migrations.AddFieldsToUsersTable do
  use Ecto.Migration

  def up do
    alter table("users") do
      add :user_name, :string, null: false, unique: true
      add :first_name, :string, null: false
      add :last_name, :string, null: false
    end

    create unique_index(:users, [:user_name])
  end

  def down do
    alter table("users") do
      remove :user_name, :string, null: false, unique: true
      remove :first_name, :string, null: false
      remove :last_name, :string, null: false
    end

    drop unique_index(:users, [:user_name])
  end
end
