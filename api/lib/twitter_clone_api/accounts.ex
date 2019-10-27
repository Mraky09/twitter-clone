defmodule TwitterCloneApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias TwitterCloneApi.Repo

  alias TwitterCloneApi.Accounts.{Relationship, User}

  @doc """
  Returns the list of relationships.

  ## Examples

      iex> list_relationships()
      [%Relationship{}, ...]

  """
  def list_relationships do
    Repo.all(Relationship)
  end

  def get_user_by_user_name!(user_name), do: Repo.get_by!(User, user_name: user_name)


  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Gets a single relationship.

  Raises `Ecto.NoResultsError` if the Relationship does not exist.

  ## Examples

      iex> get_relationship!(123)
      %Relationship{}

      iex> get_relationship!(456)
      ** (Ecto.NoResultsError)

  """
  def get_relationship!(id), do: Repo.get!(Relationship, id)

  @doc """
  Creates a relationship.

  ## Examples

      iex> create_relationship(%{field: value})
      {:ok, %Relationship{}}

      iex> create_relationship(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_relationship(attrs \\ %{}) do
    %Relationship{}
    |> Relationship.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a relationship.

  ## Examples

      iex> update_relationship(relationship, %{field: new_value})
      {:ok, %Relationship{}}

      iex> update_relationship(relationship, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_relationship(%Relationship{} = relationship, attrs) do
    relationship
    |> Relationship.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Relationship.

  ## Examples

      iex> delete_relationship(relationship)
      {:ok, %Relationship{}}

      iex> delete_relationship(relationship)
      {:error, %Ecto.Changeset{}}

  """
  def delete_relationship(%Relationship{} = relationship) do
    Repo.delete(relationship)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking relationship changes.

  ## Examples

      iex> change_relationship(relationship)
      %Ecto.Changeset{source: %Relationship{}}

  """
  def change_relationship(%Relationship{} = relationship) do
    Relationship.changeset(relationship, %{})
  end
end
