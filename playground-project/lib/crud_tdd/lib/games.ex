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
    |> validate_length(:title, [min: 4, max: 15])
    |> validate_number(:grade, [greater_than: 0, less_than: 6])
  end
end
