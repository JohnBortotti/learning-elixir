defmodule AuthApiExampleWeb.PageController do
  use AuthApiExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
