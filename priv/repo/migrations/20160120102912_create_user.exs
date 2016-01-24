defmodule FlyingWithPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      # No default, will error unless set
      add :email, :string, null: false
      # Null is baaad.
      add :first_name, :string, null: false, default: ""
      # Null is still baaad
      add :last_name, :string, null: false, default: ""

      timestamps
    end

    # Create a unique index on the email column.
    create index(:users, ["lower(email)"], unique: true)
    # Create a "normal" index
    create index(:users, ["lower(first_name)"])
    create index(:users, ["lower(last_name)"])
    # Create a compound index
    create index(:users, ["lower(first_name)", "lower(last_name)"])
  end
end
