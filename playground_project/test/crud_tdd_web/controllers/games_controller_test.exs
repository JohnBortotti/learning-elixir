defmodule CrudTddWeb.GamesControllerTest do
  use CrudTddWeb.ConnCase

  alias CrudTdd.Lib
  alias CrudTdd.Lib.Games

  @create_attrs %{
    grade: 42,
    title: "some title"
  }
  @update_attrs %{
    grade: 43,
    title: "some updated title"
  }
  @invalid_attrs %{grade: nil, title: nil}

  def fixture(:games) do
    {:ok, games} = Lib.create_games(@create_attrs)
    games
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all games", %{conn: conn} do
      conn = get(conn, Routes.games_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create games" do
    test "renders games when data is valid", %{conn: conn} do
      conn = post(conn, Routes.games_path(conn, :create), games: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.games_path(conn, :show, id))

      assert %{
               "id" => id,
               "grade" => 42,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.games_path(conn, :create), games: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update games" do
    setup [:create_games]

    test "renders games when data is valid", %{conn: conn, games: %Games{id: id} = games} do
      conn = put(conn, Routes.games_path(conn, :update, games), games: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.games_path(conn, :show, id))

      assert %{
               "id" => id,
               "grade" => 43,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, games: games} do
      conn = put(conn, Routes.games_path(conn, :update, games), games: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete games" do
    setup [:create_games]

    test "deletes chosen games", %{conn: conn, games: games} do
      conn = delete(conn, Routes.games_path(conn, :delete, games))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.games_path(conn, :show, games))
      end
    end
  end

  defp create_games(_) do
    games = fixture(:games)
    %{games: games}
  end
end
