defmodule CrudTdd.GamesData do
  import Plug.Conn
  import Ecto.Query, only: [from: 2]

  alias CrudTdd.Repo
  alias CrudTdd.Lib.Games

  def games_total(conn, _opts) do
    games_total = Repo.one(from m in Games, select: count("*"))
    put_resp_header(conn, "games_total", Integer.to_string(games_total))
  end

end
