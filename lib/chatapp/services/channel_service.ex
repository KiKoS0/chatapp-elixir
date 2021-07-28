defmodule Chatapp.ChannelService do
  alias Chatapp.{Repo, Channel}
  import Ecto.Query

  def get_by_name(name) do
    Repo.one(from u in Channel, where: u.name == ^name)
  end

  def get_all() do
    Repo.all(from(u in Channel))
  end

  def get_by_id(id) do
    Repo.one(from u in Channel, where: u.id == ^id)
  end

  def new_channel(data) do
    Channel.changeset(%Channel{}, data) |> Repo.insert()
  end
end
