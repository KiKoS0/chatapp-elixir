defmodule ChatappWeb.ChannelView do
  use ChatappWeb, :view

  def render("channel.json", %{channel: channel}) do
    %{channel_name: channel.name}
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
