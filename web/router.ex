defmodule Chatter.Router do
  use Chatter.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Chatter do
    pipe_through :api
    # Route stuff to our SessionController
    resources "session", SessionController, only: [:index]
  end
end
