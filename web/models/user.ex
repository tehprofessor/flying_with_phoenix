defmodule FlyingWithPhoenix.User do
  use FlyingWithPhoenix.Web, :model

  alias FlyingWithPhoenix.Post

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :email, :string
    field :first_name, :string, default: ""
    field :last_name, :string, default: ""

    has_many :posts, Post

    timestamps
  end

  @required_fields ~w(email)
  @optional_fields ~w(first_name last_name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
