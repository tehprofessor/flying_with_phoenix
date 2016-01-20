defmodule FlyingWithPhoenix.Users.Update do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.User
  alias FlyingWithPhoenix.Users

  def call(id, params) do
    find(id)
    |> Repo.one!
    |> User.changeset(params)
    |> Repo.update!
    |> refresh
  end

  defp refresh(model) do
    Users.get.call(%{"id" => model.id})
  end

  defp find(id) do
    from u in User,
      where: u.id == ^id,
      select: u
  end
end
