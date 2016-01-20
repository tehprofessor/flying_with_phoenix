defmodule FlyingWithPhoenix.Users do
  alias FlyingWithPhoenix.Users.List
  def list do
    List
  end

  alias FlyingWithPhoenix.Users.Get
  def get do
    Get
  end

  alias FlyingWithPhoenix.Users.Create
  def create do
    Create
  end

  alias FlyingWithPhoenix.Users.Update
  def update do
    Update
  end

  alias FlyingWithPhoenix.Users.Destroy
  def destroy do
    Destroy
  end
end
