defmodule Chatapp.MessageService do
  alias Chatapp.{Repo, Message}
  import Ecto.Query

  def new_message(data) do
    Message.changeset(%Message{}, data) |> Repo.insert()
  end
end
