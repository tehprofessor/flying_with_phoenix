defmodule FlyingWithPhoenix.PageController do
  use FlyingWithPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
