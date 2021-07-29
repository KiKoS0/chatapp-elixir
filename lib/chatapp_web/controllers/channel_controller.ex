defmodule ChatappWeb.ChannelController do
  use ChatappWeb, :controller
  alias Chatapp.ChannelService, as: ChannelService

  def create(conn, _params = %{"channel_name" => channel_name}) do
    with {:ok, channel} <- ChannelService.new_channel(%{name: channel_name}) do
      IO.puts("HELLO WORLD #{inspect(channel)}")
      conn |> render("channel_wrap.json", channel: channel)
    else
      {:error, changeset} ->
        # Just because the only error is duplicate for now
        # It needs more advanced error handling later.
        put_status(conn, 409)
        |> put_view(ChatappWeb.ErrorView)
        |> render("error.json", changeset: changeset)
    end
  end

  def show(conn, _params = %{"id" => id}) do
    case ChannelService.get_by_id(id) do
      nil ->
        put_status(conn, 404) |> put_view(ChatappWeb.ErrorView) |> render("404.json")

      channel ->
        IO.inspect(channel)
        conn |> render("channel_wrap.json", channel: channel)
    end
  end

  def index(conn, _) do
    channels = ChannelService.get_all()
    render(conn, "channels.json", channels: channels)
  end
end
