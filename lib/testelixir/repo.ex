defmodule Testelixir.Repo do
  use Ecto.Repo,
    otp_app: :testelixir,
    adapter: Ecto.Adapters.Postgres
end
