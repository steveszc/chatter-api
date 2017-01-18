# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatter,
  ecto_repos: [Chatter.Repo]

# Configures the endpoint
config :chatter, Chatter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W8T5pEurGoK93lADgOGOilMqgoCfT/Fzy9ezicgfvrSUr8wQxEyLTiK1DwwCm3aN",
  render_errors: [view: Chatter.ErrorView, accepts: ~w(json)],
  pubsub: [name: Chatter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures json-api encoder
config :phoenix, :format_encoders,
  "json-api": Poison

# Configures mime types support to add json-api
config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Configures Guardian to provide auth
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Chatter",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "AgcuH78ITwNv1JcMZgyXf7FY6S3AKbd1inndzB7rYZXVpyM8+rUaer0r0CVxsKCx",
  serializer: Chatter.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
