defmodule AuthApiExample.Repo do
  use Ecto.Repo,
    otp_app: :auth_api_example,
    adapter: Ecto.Adapters.Postgres
end
