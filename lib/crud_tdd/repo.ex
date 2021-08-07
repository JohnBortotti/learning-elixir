defmodule CrudTdd.Repo do
  use Ecto.Repo,
    otp_app: :crud_tdd,
    adapter: Ecto.Adapters.Postgres
end
