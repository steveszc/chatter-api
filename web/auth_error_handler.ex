defmodule Chatter.AuthErrorHandler do
 use Chatter.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(Chatter.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(Chatter.ErrorView, "403.json")
 end
end
