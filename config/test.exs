use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flying_with_phoenix, FlyingWithPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :flying_with_phoenix, FlyingWithPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("FLYING_WITH_PHOENIX_DB_USER") || "postgres",
  password: System.get_env("FLYING_WITH_PHOENIX_DB_PASS") || "",
  database: System.get_env("FLYING_WITH_PHOENIX_DB_NAME") || "flying_with_phoenix_#{Mix.env}",
  hostname: System.get_env("FLYING_WITH_PHOENIX_DB_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
