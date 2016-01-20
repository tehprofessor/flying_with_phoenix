defmodule FlyingWithPhoenix.Posts.Get do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.Post, as: Post

  def call(params) do
    filter(params)
    |> Repo.one!
    |> Map.take([:id, :title, :body])
  end

  defp filter(%{"user_id" => user_id}) do
    from p in Post,
      where: p.user_id == ^user_id,
      select: p
  end

  defp filter(%{"id" => id}) do
    from p in Post,
      where: p.id == ^id,
      select: p
  end
end
