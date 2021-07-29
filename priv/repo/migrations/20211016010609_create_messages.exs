defmodule Chatapp.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :text
      add :user_id, references(:users)
      add :channel_id, references(:channels)
      timestamps()
    end
  end
end
