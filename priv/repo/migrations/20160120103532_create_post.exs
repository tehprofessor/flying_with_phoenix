defmodule FlyingWithPhoenix.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false, default: ""
      add :body, :text, null: false, default: ""

      # Setup user_id as a foreign key, unlike say, ActiveRecord...
      # - and -
      # Use :delete_all to prevent orphaned posts when a user is deleted.
      # It's recommended to set this here, instead of in the model.
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all)

      timestamps
    end

    create index(:posts, [:user_id])
    create index(:posts, [:title])
  end
end
