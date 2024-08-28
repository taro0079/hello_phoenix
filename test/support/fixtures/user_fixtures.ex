defmodule HelloPhoenix.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HelloPhoenix.User` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> HelloPhoenix.User.create_users()

    users
  end
end
