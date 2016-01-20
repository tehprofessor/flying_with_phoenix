defmodule FlyingWithPhoenix.Users.List do
  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.User
  def call do
    for user <- Repo.all(User), into: [] do
      Map.take(user, [:id, :email, :first_name, :last_name])
    end
  end
end
