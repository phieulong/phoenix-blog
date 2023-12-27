defmodule Blog.UsersTest do
  use Blog.DataCase

  alias Blog.Users

  describe "users" do
    alias Blog.Users.User

    import Blog.UsersFixtures

    @invalid_attrs %{confirmed_at: nil, email: nil, hashed_password: nil, password: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{confirmed_at: ~N[2023-12-25 07:35:00], email: "some email", hashed_password: "some hashed_password", password: "some password", username: "some username"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.confirmed_at == ~N[2023-12-25 07:35:00]
      assert user.email == "some email"
      assert user.hashed_password == "some hashed_password"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{confirmed_at: ~N[2023-12-26 07:35:00], email: "some updated email", hashed_password: "some updated hashed_password", password: "some updated password", username: "some updated username"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.confirmed_at == ~N[2023-12-26 07:35:00]
      assert user.email == "some updated email"
      assert user.hashed_password == "some updated hashed_password"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "users" do
    alias Blog.Users.User

    import Blog.UsersFixtures

    @invalid_attrs %{confirmed_at: nil, email: nil, hashed_password: nil, password: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{confirmed_at: ~N[2023-12-25 07:53:00], email: "some email", hashed_password: "some hashed_password", password: "some password", username: "some username"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.confirmed_at == ~N[2023-12-25 07:53:00]
      assert user.email == "some email"
      assert user.hashed_password == "some hashed_password"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{confirmed_at: ~N[2023-12-26 07:53:00], email: "some updated email", hashed_password: "some updated hashed_password", password: "some updated password", username: "some updated username"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.confirmed_at == ~N[2023-12-26 07:53:00]
      assert user.email == "some updated email"
      assert user.hashed_password == "some updated hashed_password"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
