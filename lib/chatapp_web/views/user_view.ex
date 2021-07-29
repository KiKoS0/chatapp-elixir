defmodule ChatappWeb.UserView do
  use ChatappWeb, :view

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end

  def render("user_wrap.json", %{user: user}) do
    %{data: render_one(user, __MODULE__, "user.json")}
  end
end
