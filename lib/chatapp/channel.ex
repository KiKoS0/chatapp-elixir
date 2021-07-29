defmodule Chatapp.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channels" do
    field :name, :string
    field :description, :string
    has_many :messages, Chatapp.Message
    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name, :description])
    |> unique_constraint(:name)
    |> validate_required([:name])
  end
end
