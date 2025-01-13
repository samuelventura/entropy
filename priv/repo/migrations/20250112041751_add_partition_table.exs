defmodule Entropy.Repo.Migrations.AddPartitionTable do
  use Ecto.Migration

  def change do
    create table(:partitions) do
      add :n, :integer, null: false
      add :p, :map, null: false
    end
  end
end
