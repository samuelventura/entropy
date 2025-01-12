defmodule Entropy.Repo do
  use Ecto.Repo,
    otp_app: :entropy,
    adapter: Ecto.Adapters.Postgres
end
