defmodule ChatappWeb.UserView do
  use ChatappWeb, :view

  def render("user.json", %{username: username}) do
    %{data: %{username: username}}
  end
end
