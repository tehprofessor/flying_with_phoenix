defmodule FlyingWithPhoenix.Users.Create do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.Users
  alias FlyingWithPhoenix.User, as: User

  def call(user_params) do
    changeset(user_params)
    |> Repo.insert!
    |> refresh
  end

  defp changeset(params) do
    User.changeset(%User{}, params)
  end

  defp refresh(model) do
    Users.get.call(%{"id" => model.id})
  end
end
