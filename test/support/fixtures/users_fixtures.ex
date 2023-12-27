defmodule Blog.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        confirmed_at: ~N[2023-12-25 07:35:00],
        email: "some email",
        hashed_password: "some hashed_password",
        password: "some password",
        username: "some username"
      })
      |> Blog.Users.create_user()

    user
  end
end
