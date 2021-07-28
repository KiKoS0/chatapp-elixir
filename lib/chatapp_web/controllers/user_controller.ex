defmodule ChatappWeb.UserController do
  use ChatappWeb, :controller
  alias Chatapp.UserService, as: UserService

  def login(conn, _params = %{"username" => username}) do
    case UserService.get_by_username(username) do
      nil -> conn |> put_view(ChatappWeb.ErrorView) |> render("404.json")
      user -> conn |> render("user.json", username: user.username)
    end
  end

  def create(conn, params) do
    with {:ok, user} <- UserService.new_user(params) do
      conn |> render("user.json", username: user.username)
    else
      {:error, changeset} ->
        conn |> put_view(ChatappWeb.ErrorView) |> render("error.json", changeset: changeset)
    end
  end
end
