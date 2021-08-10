defmodule CrudTddWeb.GamesController do
  use CrudTddWeb, :controller
  import CrudTdd.GamesData

  alias CrudTdd.Lib
  alias CrudTdd.Lib.Games

  plug :games_total

  action_fallback CrudTddWeb.FallbackController

  def index(conn, _params) do
    games = Lib.list_games()
    render(conn, "index.json", games: games)
  end

  def create(conn, %{"games" => games_params}) do
    with {:ok, %Games{} = games} <- Lib.create_games(games_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.games_path(conn, :show, games))
      |> render("show.json", games: games)
    end
  end

  def show(conn, %{"id" => id}) do
    games = Lib.get_games!(id)
    render(conn, "show.json", games: games)
  end

  def update(conn, %{"id" => id, "games" => games_params}) do
    games = Lib.get_games!(id)

    with {:ok, %Games{} = games} <- Lib.update_games(games, games_params) do
      render(conn, "show.json", games: games)
    end
  end

  def delete(conn, %{"id" => id}) do
    games = Lib.get_games!(id)

    with {:ok, %Games{}} <- Lib.delete_games(games) do
      send_resp(conn, :no_content, "")
    end
  end
end
