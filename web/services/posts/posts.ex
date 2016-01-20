defmodule FlyingWithPhoenix.Posts do
  alias FlyingWithPhoenix.Posts.List
  def list do
    List
  end

  alias FlyingWithPhoenix.Posts.Get
  def get do
    Get
  end

  alias FlyingWithPhoenix.Posts.Create
  def create do
    Create
  end

  alias FlyingWithPhoenix.Posts.Update
  def update do
    Update
  end

  alias FlyingWithPhoenix.Posts.Destroy
  def destroy do
    Destroy
  end
end
