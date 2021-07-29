defmodule ChatappWeb.RoomChannel do
  # Channel is renamed to Room because the `Channel` context
  # used by phoenix already, and reusing it will be confusing
  use Phoenix.Channel

  def join("room:" <> _private_room_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", message, socket) do
    broadcast!(socket, "new_msg", %{data: message})
    {:noreply, socket}
  end
end
