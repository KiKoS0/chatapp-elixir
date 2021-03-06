defmodule ChatappWeb.UserController do
  use ChatappWeb, :controller
  use PhoenixSwagger
  alias Chatapp.UserService, as: UserService

  def login(conn, _params = %{"username" => username}) do
    case UserService.get_by_username(username) do
      nil -> conn |> put_view(ChatappWeb.ErrorView) |> render("404.json")
      user -> conn |> render("user_wrap.json", user: user)
    end
  end

  def create(conn, _params = %{"username" => username}) do
    with {:ok, user} <- UserService.new_user(%{username: username}) do
      conn |> render("user_wrap.json", user: user)
    else
      {:error, changeset} ->
        # Just because the only error is duplicate for now
        # It needs more advanced error handling later.
        put_status(conn, 409)
        |> put_view(ChatappWeb.ErrorView)
        |> render("error.json", changeset: changeset)
    end
  end

  swagger_path :create do
    post("/api/v1/users")
    description("Create new user")
    produces("application/json")

    parameters do
      username(:query, :string, "User usuername", required: true)
    end

    # should probably create schemas instead
    response(200, "OK")
  end

  swagger_path :login do
    post("/api/v1/users/login")
    description("\"Login\" user")
    produces("application/json")

    parameters do
      username(:query, :string, "User usuername", required: true)
    end

    # should probably create schemas instead
    response(200, "OK")
  end
end
