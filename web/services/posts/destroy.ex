defmodule FlyingWithPhoenix.Posts.Destroy do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.Post

  def call(id) do
    post = find(id) |> Repo.one!
    case post do
      nil ->
        %{"message": "error"}
      _ ->
        Repo.delete!(post)
        %{"message": "ok"}
    end
  end

  def find(id) do
    from p in Post,
      where: p.id == ^id,
      select: p
  end
end
