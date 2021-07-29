defmodule ChatappWeb.UserView do
  use ChatappWeb, :view

  def render("user.json", %{user: user}) do
    %{data: %{id: user.id, username: user.username}}
  end
end
