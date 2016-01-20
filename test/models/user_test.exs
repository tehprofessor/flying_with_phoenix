defmodule FlyingWithPhoenix.UserTest do
  use FlyingWithPhoenix.ModelCase

  alias FlyingWithPhoenix.User

  @valid_attrs tacos("user")
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
