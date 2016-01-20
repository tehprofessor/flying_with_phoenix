defmodule FlyingWithPhoenix.UsersControllerTest do
  use FlyingWithPhoenix.ConnCase

  alias FlyingWithPhoenix.Users

  @user tacos("user")

  setup do
    {:ok, user_data: @user}
  end

  test "POST /users", context do
    conn = post conn(), "/users", %{"user" => context.user_data}
    json = json_response(conn, 200)

    refute json["id"] == nil
    assert json["email"] == context.user_data["email"]
    assert json["first_name"] == context.user_data["first_name"]
    assert json["last_name"] == context.user_data["last_name"]
  end

  test "GET /users", context do
    Users.create.call(context.user_data)
    conn = get conn(), "/users"
    json = json_response(conn, 200)

    assert Enum.count(json) > 0
  end

  test "GET /users/:id", context do
    user = Users.create.call(context.user_data)
    conn = get conn(), "/users/#{user.id}"
    json = json_response(conn, 200)

    assert json["id"] == user.id
    assert json["email"] == user.email
    assert json["first_name"] == user.first_name
    assert json["last_name"] == user.last_name
  end

  test "PUT /users/:id", context do
    user = Users.create.call(context.user_data)

    user_delta = Map.merge(user, %{email: "tinyrick@ricksanchez.com"})

    conn = put conn(), "/users/#{user.id}", %{user: user_delta}
    json = json_response(conn, 200)

    assert json["id"] == user.id
    assert json["email"] == user_delta.email
    assert json["first_name"] == user.first_name
    assert json["last_name"] == user.last_name
  end

  test "DELETE /users/:id", context do
    user = Users.create.call(context.user_data)

    conn = delete conn(), "/users/#{user.id}"
    json = json_response(conn, 200)

    assert json["message"] == "ok"
  end
end
