defmodule FlyingWithPhoenix.UsersController do
  use FlyingWithPhoenix.Web, :controller

  alias FlyingWithPhoenix.Users

  # Underscored function arguments are just placeholders.
  def index(conn, _params) do
    results = Users.list.call
    json conn, results
  end

  def show(conn, %{"id" => id}) do
    result = Users.get.call(%{"id" => id})
    json conn, result
  end

  def create(conn, %{"user" => params}) do
    result = Users.create.call(params)
    json conn, result
  end

  def update(conn, %{"id" => id, "user" => params}) do
    result = Users.update.call(id, params)
    json conn, result
  end

  def destroy(conn, %{"id" => id}) do
    result = Users.destroy.call(id)
    json conn, result
  end
end
