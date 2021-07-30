defmodule ChatappWeb.ChannelController do
  use ChatappWeb, :controller
  use PhoenixSwagger
  alias Chatapp.ChannelService, as: ChannelService

  def create(conn, _params = %{"channel_name" => channel_name, "description" => description}) do
    with {:ok, channel} <-
           ChannelService.new_channel(%{name: channel_name, description: description}) do
      IO.puts("HELLO WORLD #{inspect(channel)}")

      ChatappWeb.Endpoint.broadcast(
        "room:global",
        "channel_add",
        ChatappWeb.ChannelView.render("channel_wrap.json", channel: channel)
      )

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

  swagger_path :index do
    get("/api/v1/channels")
    description("List all channels")
    produces("application/json")
    # should probably create schemas instead
    response(200, "OK")
  end

  swagger_path :show do
    get("/api/v1//channels/{id}")
    description("Get channel by id")
    produces("application/json")
    # should probably create schemas instead
    response(200, "OK")

    parameters do
      id(:path, :string, "Channel ID", required: true)
    end
  end

  swagger_path :create do
    post("/api/v1/channels")
    description("Create new channel")
    produces("application/json")

    parameters do
      channel_name(:query, :string, "Channel ID", required: true)
      description(:query, :string, "Channel Description", required: true)
    end

    # should probably create schemas instead
    response(200, "OK")
    response(409, "Duplicate channel name")
  end
end
