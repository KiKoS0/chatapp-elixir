defmodule ChatappWeb.MessageController do
  use ChatappWeb, :controller
  alias Chatapp.MessageService, as: MessageService

  def create(
        conn,
        _params = %{"channel_id" => channel_id, "content" => content, "user_id" => user_id}
      ) do
    with {:ok, message} <-
           MessageService.new_message(%{
             content: content,
             user_id: user_id,
             channel_id: channel_id
           }) do
      ChatappWeb.Endpoint.broadcast(
        "room:#{channel_id}",
        "new_msg",
        ChatappWeb.MessageView.render("message_wrap.json", message: message)
      )

      conn |> render("message_wrap.json", message: message)
    else
      {:error, changeset} ->
        put_status(conn, 400)
        |> put_view(ChatappWeb.ErrorView)
        |> render("error.json", changeset: changeset)
    end
  end

  def index(conn, _params = %{"channel_id" => channel_id}) do
    messages = MessageService.get_messages_in_channel(channel_id)
    render(conn, "messages.json", messages: messages)
  end
end
