defmodule FlyingWithPhoenix.PostsController do
  use FlyingWithPhoenix.Web, :controller

  alias FlyingWithPhoenix.Posts

  def index(conn, %{"user_id" => user_id}) do
    results = Posts.list.call(user_id)
    json conn, results
  end

  def show(conn, %{"user_id" => _, "id" => id}) do
    result = Posts.get.call(%{"id" => id})
    json conn, result
  end

  def create(conn, %{"user_id" => user_id, "post" => params}) do
    result = Posts.create.call(user_id, params)
    json conn, result
  end

  def update(conn, %{"user_id" => _, "id" => id, "post" => params}) do
    result = Posts.update.call(id, params)
    json conn, result
  end

  def destroy(conn, %{"user_id" => _, "id" => id}) do
    result = Posts.destroy.call(id)
    json conn, result
  end
end
