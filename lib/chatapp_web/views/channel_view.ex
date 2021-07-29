defmodule ChatappWeb.ChannelView do
  use ChatappWeb, :view

  def render("channel.json", %{channel: channel}) do
    %{
      id: channel.id,
      channel_name: channel.name,
      description: channel.description
      # messages: render_many(channel.messages, ChatappWeb.MessageView, "message.json")
    }
  end

  def render("channel_wrap.json", %{channel: channel}) do
    inspect(channel)
    %{data: render_one(channel, __MODULE__, "channel.json")}
  end

  def render("channels.json", %{channels: channels}) do
    inspect(channels)
    %{data: render_many(channels, __MODULE__, "channel.json")}
  end
end
