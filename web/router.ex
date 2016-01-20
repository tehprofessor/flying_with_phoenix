defmodule FlyingWithPhoenix.Router do
  use FlyingWithPhoenix.Web, :router

  alias FlyingWithPhoenix.PostsController
  alias FlyingWithPhoenix.UsersController

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlyingWithPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/users" do
    pipe_through :api

    get     "/",    UsersController, :index
    get     "/:id", UsersController, :show
    post    "/",    UsersController, :create
    put     "/:id", UsersController, :update
    delete  "/:id", UsersController, :destroy

    get     "/:user_id/posts/", PostsController, :index
    get     "/:user_id/posts/:id", PostsController, :show
    post    "/:user_id/posts/",    PostsController, :create
    put     "/:user_id/posts/:id", PostsController, :update
    delete  "/:user_id/posts/:id", PostsController, :destroy
  end

  # Other scopes may use custom stacks.
  # scope "/api", FlyingWithPhoenix do
  #   pipe_through :api
  # end
end
