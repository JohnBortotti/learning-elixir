defmodule CrudTddWeb.GamesView do
  use CrudTddWeb, :view
  alias CrudTddWeb.GamesView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GamesView, "games.json")}
  end

  def render("show.json", %{games: games}) do
    %{data: render_one(games, GamesView, "games.json")}
  end

  def render("games.json", %{games: games}) do
    %{id: games.id,
      title: games.title,
      grade: games.grade}
  end
end
