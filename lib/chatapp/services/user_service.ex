defmodule Chatapp.UserService do
  alias Chatapp.{Repo, User}
  import Ecto.Query

  def get_by_username(username) do
    Repo.one(from u in User, where: u.username == ^username)
  end

  def new_user(data) do
    User.changeset(%User{}, data) |> Repo.insert()
  end
end
