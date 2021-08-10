defmodule CrudTddWeb.PageController do
  use CrudTddWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
