defmodule CrudTdd.Lib do
  @moduledoc """
  The Lib context.
  """

  import Ecto.Query, warn: false
  alias CrudTdd.Repo

  alias CrudTdd.Lib.Games

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Games{}, ...]

  """
  def list_games do
    Repo.all(Games)
  end

  @doc """
  Gets a single games.

  Raises `Ecto.NoResultsError` if the Games does not exist.

  ## Examples

      iex> get_games!(123)
      %Games{}

      iex> get_games!(456)
      ** (Ecto.NoResultsError)

  """
  def get_games!(id), do: Repo.get!(Games, id)

  @doc """
  Creates a games.

  ## Examples

      iex> create_games(%{field: value})
      {:ok, %Games{}}

      iex> create_games(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_games(attrs \\ %{}) do
    %Games{}
    |> Games.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a games.

  ## Examples

      iex> update_games(games, %{field: new_value})
      {:ok, %Games{}}

      iex> update_games(games, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_games(%Games{} = games, attrs) do
    games
    |> Games.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a games.

  ## Examples

      iex> delete_games(games)
      {:ok, %Games{}}

      iex> delete_games(games)
      {:error, %Ecto.Changeset{}}

  """
  def delete_games(%Games{} = games) do
    Repo.delete(games)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking games changes.

  ## Examples

      iex> change_games(games)
      %Ecto.Changeset{data: %Games{}}

  """
  def change_games(%Games{} = games, attrs \\ %{}) do
    Games.changeset(games, attrs)
  end
end
