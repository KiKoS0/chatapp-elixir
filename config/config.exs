# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chatapp,
  ecto_repos: [Chatapp.Repo]

# Configures the endpoint
config :chatapp, ChatappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NagW2eTGlACwYCHk50JU5Lk+Rr1jxQ3uNeYfy6Dw/mSTdte4h4BIzAWWjnLdK6pv",
  render_errors: [view: ChatappWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chatapp.PubSub,
  live_view: [signing_salt: "lV89Fh5u"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :chatapp, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      # phoenix routes will be converted to swagger paths
      router: ChatappWeb.Router,
      # (optional) endpoint config used to set host, port and https schemes.
      endpoint: ChatappWeb.Endpoint
    ]
  }

config :phoenix_swagger, json_library: Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
