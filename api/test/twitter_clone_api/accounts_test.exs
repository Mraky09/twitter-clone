defmodule TwitterCloneApi.AccountsTest do
  use TwitterCloneApi.DataCase

  alias TwitterCloneApi.Accounts

  describe "relationships" do
    alias TwitterCloneApi.Accounts.Relationship

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def relationship_fixture(attrs \\ %{}) do
      {:ok, relationship} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_relationship()

      relationship
    end

    test "list_relationships/0 returns all relationships" do
      relationship = relationship_fixture()
      assert Accounts.list_relationships() == [relationship]
    end

    test "get_relationship!/1 returns the relationship with given id" do
      relationship = relationship_fixture()
      assert Accounts.get_relationship!(relationship.id) == relationship
    end

    test "create_relationship/1 with valid data creates a relationship" do
      assert {:ok, %Relationship{} = relationship} = Accounts.create_relationship(@valid_attrs)
    end

    test "create_relationship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_relationship(@invalid_attrs)
    end

    test "update_relationship/2 with valid data updates the relationship" do
      relationship = relationship_fixture()
      assert {:ok, %Relationship{} = relationship} = Accounts.update_relationship(relationship, @update_attrs)
    end

    test "update_relationship/2 with invalid data returns error changeset" do
      relationship = relationship_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_relationship(relationship, @invalid_attrs)
      assert relationship == Accounts.get_relationship!(relationship.id)
    end

    test "delete_relationship/1 deletes the relationship" do
      relationship = relationship_fixture()
      assert {:ok, %Relationship{}} = Accounts.delete_relationship(relationship)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_relationship!(relationship.id) end
    end

    test "change_relationship/1 returns a relationship changeset" do
      relationship = relationship_fixture()
      assert %Ecto.Changeset{} = Accounts.change_relationship(relationship)
    end
  end
end
