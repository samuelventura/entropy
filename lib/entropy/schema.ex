defmodule Entropy.Schema do
  defmodule Partitions do
    use Ecto.Schema

    schema "partitions" do
      field :n, :integer
      field :p, :map
    end
  end
end
