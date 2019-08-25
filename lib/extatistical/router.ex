defmodule Extatistical.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    conn
    |> send_resp(404, Poison.encode!(%{
      message: "Route not found"
    }))
  end
end
