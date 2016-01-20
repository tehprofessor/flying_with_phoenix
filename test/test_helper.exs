ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FlyingWithPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FlyingWithPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FlyingWithPhoenix.Repo)

