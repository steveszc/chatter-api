defmodule Chatter.UserController do
  use Chatter.Web, :controller

  alias Chatter.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Chatter.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Chatter.UserView, "show.json", user: user)
  end
end
