# FlyingWithPhoenix

## Setup

#### Software

1. Elixir >= 1.2.0
2. PostgreSQL

#### Environment

```bash
export FLYING_WITH_PHOENIX_DB_USER=YOUR_PG_USERNAME
export FLYING_WITH_PHOENIX_DB_PASS=YOUR_PG_PASSWORD
export FLYING_WITH_PHOENIX_DB_HOST=YOUR_PG_HOST
export FLYING_WITH_PHOENIX_DB_NAME=YOUR_PG_DATABASE_NAME

# Optional
# Create a new one with: mix phoenix.gen.secret
export FLYING_WITH_PHOENIX_SECRET_KEY_BASE="ujmx1+rwc3U/Wt844QjQ+GHL3OOa+/u8+Og/WDpabJaIiGsEY1gnlhw6eF7ma+Xw"
```

## Development

To start your the app in development:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Run the tests to verify installation `mix test`
  4. Start Phoenix endpoint, and an interactive console, with `iex -S mix phoenix.server`
