defmodule FlyingWithPhoenix.PostsControllerTest do
  use FlyingWithPhoenix.ConnCase

  alias FlyingWithPhoenix.Users
  alias FlyingWithPhoenix.Posts

  @user tacos("user")
  @post tacos("post")

  setup do
    user = Users.create.call(@user)
    {:ok, user: user, post_data: @post}
  end

  test "POST /users/:user_id/posts", context do
    conn = post conn(), "/users/#{context.user.id}/posts", %{"post" => context.post_data}
    json = json_response(conn, 200)

    refute json["id"] == nil
    assert json["title"] == context.post_data["title"]
    assert json["body"] == context.post_data["body"]
  end

  test "GET /users/:user_id/posts", context do
    Posts.create.call(context.user.id, context.post_data)
    conn = get conn(), "/users/#{context.user.id}/posts"
    json = json_response(conn, 200)

    assert Enum.count(json) > 0
  end

  test "GET /users/:user_id/posts/:id", context do
    post = Posts.create.call(context.user.id, context.post_data)

    conn = get conn(), "/users/#{context.user.id}/posts/#{post.id}"
    json = json_response(conn, 200)

    assert json["id"] == post.id
    assert json["title"] == post.title
    assert json["body"] == post.body
  end

  test "PUT /users/:id/posts/:id", context do
    post = Posts.create.call(context.user.id, context.post_data)

    post_delta = Map.merge(post, %{title: "Get Shwifty..."})
    update_path = "/users/#{context.user.id}/posts/#{post.id}"

    conn = put conn(), update_path, %{post: post_delta}

    json = json_response(conn, 200)

    assert json["id"] == post.id
    assert json["title"] == post_delta.title
    assert json["body"] == post.body
  end

  test "DELETE /users/:id/posts/:id", context do
    post = Posts.create.call(context.user.id, context.post_data)

    delete_path = "/users/#{context.user.id}/posts/#{post.id}"
    conn = delete conn(), delete_path
    json = json_response(conn, 200)

    assert json["message"] == "ok"
  end
end
