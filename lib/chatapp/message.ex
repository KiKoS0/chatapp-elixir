defmodule Chatapp.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    belongs_to :user, Chatapp.User
    belongs_to :channel, Chatapp.Channel
    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :user_id, :channel_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:channel_id)
    |> validate_required([:content, :user_id, :channel_id])
  end
end
