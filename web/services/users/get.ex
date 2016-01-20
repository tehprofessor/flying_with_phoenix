defmodule FlyingWithPhoenix.Users.Get do
  import Ecto.Query

  alias FlyingWithPhoenix.Repo
  alias FlyingWithPhoenix.User, as: User

  def call(params) do
    filter(params)
    |> Repo.one!
    |> Map.take([:id, :email, :first_name, :last_name])
  end

  defp filter(%{"email" => user_email}) do
    email = "%#{user_email}%"
    from u in User,
      where: ilike(u.email, ^email),
      select: u
  end

  defp filter(%{"first_name" => user_first_name}) do
    first_name = "%#{user_first_name}"
    from u in User,
      where: like(u.first_name, ^first_name),
      select: u
  end

  defp filter(%{"last_name" => user_last_name}) do
    last_name = "%#{user_last_name}%"
    from u in User,
      where: like(u.last_name, ^last_name),
      select: u
  end

  defp filter(%{"id" => id}) do
    from u in User,
      where: u.id == ^id,
      select: u
  end
end
