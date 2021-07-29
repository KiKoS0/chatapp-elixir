defmodule Chatapp.MessageService do
  alias Chatapp.{Repo, Message}
  import Ecto.Query

  def new_message(data) do
    with {:ok, message} <- Message.changeset(%Message{}, data) |> Repo.insert() do
      message = message |> Repo.preload([:user])
      {:ok, message}
    end
  end

  def get_messages_in_channel(channel_id) do
    Repo.all(from m in Message, where: m.channel_id == ^channel_id, order_by: :inserted_at)
    |> Repo.preload([:user])
  end
end
