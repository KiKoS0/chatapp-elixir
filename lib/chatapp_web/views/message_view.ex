defmodule ChatappWeb.MessageView do
  use ChatappWeb, :view

  def render("message.json", %{message: message}) do
    %{
      id: message.id,
      content: message.content,
      created_at: message.inserted_at
    }
  end

  def render("message_with_user.json", %{message: message}) do
    %{
      id: message.id,
      content: message.content,
      created_at: message.inserted_at,
      user: render_one(message.user, ChatappWeb.UserView, "user.json")
    }
  end

  def render("message_wrap.json", %{message: message}) do
    inspect(message)
    %{data: render_one(message, __MODULE__, "message_with_user.json")}
  end

  def render("messages.json", %{messages: messages}) do
    inspect(messages)
    %{data: render_many(messages, __MODULE__, "message_with_user.json")}
  end
end
