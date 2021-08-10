defmodule CrudTdd.LibTest do
  use CrudTdd.DataCase

  alias CrudTdd.Lib

  describe "games" do
    alias CrudTdd.Lib.Games

    @valid_attrs %{grade: 42, title: "some title"}
    @update_attrs %{grade: 43, title: "some updated title"}
    @invalid_attrs %{grade: nil, title: nil}

    def games_fixture(attrs \\ %{}) do
      {:ok, games} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lib.create_games()

      games
    end

    test "list_games/0 returns all games" do
      games = games_fixture()
      assert Lib.list_games() == [games]
    end

    test "get_games!/1 returns the games with given id" do
      games = games_fixture()
      assert Lib.get_games!(games.id) == games
    end

    test "create_games/1 with valid data creates a games" do
      assert {:ok, %Games{} = games} = Lib.create_games(@valid_attrs)
      assert games.grade == 42
      assert games.title == "some title"
    end

    test "create_games/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lib.create_games(@invalid_attrs)
    end

    test "update_games/2 with valid data updates the games" do
      games = games_fixture()
      assert {:ok, %Games{} = games} = Lib.update_games(games, @update_attrs)
      assert games.grade == 43
      assert games.title == "some updated title"
    end

    test "update_games/2 with invalid data returns error changeset" do
      games = games_fixture()
      assert {:error, %Ecto.Changeset{}} = Lib.update_games(games, @invalid_attrs)
      assert games == Lib.get_games!(games.id)
    end

    test "delete_games/1 deletes the games" do
      games = games_fixture()
      assert {:ok, %Games{}} = Lib.delete_games(games)
      assert_raise Ecto.NoResultsError, fn -> Lib.get_games!(games.id) end
    end

    test "change_games/1 returns a games changeset" do
      games = games_fixture()
      assert %Ecto.Changeset{} = Lib.change_games(games)
    end
  end
end
