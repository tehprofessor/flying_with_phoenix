defmodule FlyingWithPhoenix.PostTest do
  use FlyingWithPhoenix.ModelCase

  alias FlyingWithPhoenix.Post

  @valid_attrs tacos("post") |> Map.merge(%{"user_id" => Ecto.UUID.generate})
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
