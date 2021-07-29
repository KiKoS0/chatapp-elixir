defmodule Chatapp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    has_many :messages, Chatapp.Message
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username])
    |> unique_constraint(:username)
    |> validate_required([:username])
  end
end
