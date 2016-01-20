defmodule FlyingWithPhoenix.Posts.Update do
  import Ecto.Query

  alias FlyingWithPhoenix.Post
  alias FlyingWithPhoenix.Posts
  alias FlyingWithPhoenix.Repo

  def call(id, params) do
    find(id)
    |> Repo.one!
    |> Post.changeset(params)
    |> Repo.update!
    |> refresh
  end

  defp refresh(model) do
    Posts.get.call(%{"id" => model.id})
  end

  defp find(id) do
    from p in Post,
      where: p.id == ^id,
      select: p
  end
end
