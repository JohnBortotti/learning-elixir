# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_api_example,
  ecto_repos: [AuthApiExample.Repo]

# Configures the endpoint
config :auth_api_example, AuthApiExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hAon7ddNF97DYp59YdFVXG7O/ldzDf/6RAvlrc644VCUHnicYdt6mJCYJPplfeCd",
  render_errors: [view: AuthApiExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AuthApiExample.PubSub,
  live_view: [signing_salt: "1ztFz6X6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
