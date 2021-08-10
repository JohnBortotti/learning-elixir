defmodule CrudTdd.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :grade, :integer

      timestamps()
    end

  end
end
