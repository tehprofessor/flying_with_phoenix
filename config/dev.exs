use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :flying_with_phoenix, FlyingWithPhoenix.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :flying_with_phoenix, FlyingWithPhoenix.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :flying_with_phoenix, FlyingWithPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("FLYING_WITH_PHOENIX_DB_USER") || "postgres",
  password: System.get_env("FLYING_WITH_PHOENIX_DB_PASS") || "",
  database: System.get_env("FLYING_WITH_PHOENIX_DB_NAME") || "flying_with_phoenix_#{Mix.env}",
  hostname: System.get_env("FLYING_WITH_PHOENIX_DB_HOST") || "localhost",
  pool_size: 10
