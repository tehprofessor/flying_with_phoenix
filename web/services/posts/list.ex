defmodule FlyingWithPhoenix.Posts.List do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.Post

  def call(user_id) do
    query = filter(user_id)
    for post <- Repo.all(query), into: [] do
      Map.take(post, [:id, :title, :body, :user_id])
    end
  end

  defp filter(user_id) do
    from p in Post,
      where: p.user_id == ^user_id
  end
end
