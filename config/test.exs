use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, Chatter.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :chatter, Chatter.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DOCKERDB_ENV_POSTGRESQL_USER"),
  password: System.get_env("DOCKERDB_ENV_POSTGRESQL_PASS"),
  database: System.get_env("DOCKERDB_ENV_POSTGRESQL_DB_TEST"),
  hostname: System.get_env("DOCKERDB_PORT_5432_TCP_ADDR"),
  port: System.get_env("DOCKERDB_PORT_5432_TCP_PORT"),
  pool: Ecto.Adapters.SQL.Sandbox
