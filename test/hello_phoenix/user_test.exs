defmodule HelloPhoenix.UserTest do
  use HelloPhoenix.DataCase

  alias HelloPhoenix.User

  describe "users" do
    alias HelloPhoenix.User.Users

    import HelloPhoenix.UserFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert User.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert User.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %Users{} = users} = User.create_users(valid_attrs)
      assert users.name == "some name"
      assert users.age == 42
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %Users{} = users} = User.update_users(users, update_attrs)
      assert users.name == "some updated name"
      assert users.age == 43
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_users(users, @invalid_attrs)
      assert users == User.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = User.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> User.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = User.change_users(users)
    end
  end
end
