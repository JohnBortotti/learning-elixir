defmodule CrudTdd.Lib.Games do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :grade, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(games, attrs) do
    games
    |> cast(attrs, [:title, :grade])
    |> validate_required([:title, :grade])
  end
end
