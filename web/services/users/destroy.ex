defmodule FlyingWithPhoenix.Users.Destroy do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.User

  def call(id) do
    user = find(id) |> Repo.one!
    case user do
      nil ->
        %{"message": "error"}
      _ ->
        Repo.delete!(user)
        %{"message": "ok"}
    end
  end

  def find(id) do
    from u in User,
      where: u.id == ^id,
      select: u
  end
end
