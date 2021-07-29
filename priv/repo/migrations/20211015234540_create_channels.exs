defmodule Chatapp.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :description, :string

      timestamps()
    end
    create unique_index(:channels, [:name])

  end
end
