defmodule Extatistical.Endpoint do
  use Plug.Builder

  plug Plug.RequestId

  plug Plug.Logger
  plug Plug.MethodOverride
  plug Plug.Head

  plug Extatistical.Middlewares.Params
  plug Extatistical.Router

  plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json], pass: ["*/*"], json_decoder: Poison
end
