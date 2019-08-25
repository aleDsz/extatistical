defmodule Extatistical.Middlewares.Params do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("application/json")
    |> assign(:params, get_params(conn))
  end

  def get_params(%Plug.Conn{path_params: %{"glob" => _glob}} = conn) do
    case conn.assigns do
      %{} ->
        %{}
        |> Map.merge(conn.path_params)
        |> Map.delete("glob")

      params ->
        params
        |> Map.merge(conn.path_params)
        |> Map.delete("glob")
    end
  end

  def get_params(%Plug.Conn{path_params: %{}} = conn) do
    case read_body(conn) do
      {:ok, body, conn} ->
        case body do
          "" ->
            params =
              conn
              |> fetch_query_params()

            params.query_params

          body ->
            Poison.decode!(body)
        end

      _body ->
        %{}
    end
  end
end
