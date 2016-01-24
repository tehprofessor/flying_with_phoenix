defmodule FlyingWithPhoenix.Post do
  use FlyingWithPhoenix.Web, :model

  alias FlyingWithPhoenix.User

  schema "posts" do
    field :title, :string, default: ""
    field :body, :string, default: ""

    belongs_to :user, User, references: :id, type: :binary_id

    timestamps
  end

  @required_fields ~w(user_id)
  @optional_fields ~w(title body)

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
