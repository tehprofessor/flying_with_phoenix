defmodule FlyingWithPhoenix.Posts.Create do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.Posts
  alias FlyingWithPhoenix.Post, as: Post

  def call(user_id, post_params) do
    Map.merge(post_params, %{"user_id" => user_id})
    |> changeset
    |> Repo.insert!
    |> refresh
  end

  defp changeset(params) do
    Post.changeset(%Post{}, params)
  end

  defp refresh(model) do
    Posts.get.call(%{"id" => model.id})
  end
end
