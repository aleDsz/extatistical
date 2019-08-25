defmodule Extatistical.Repo.Migrations.CreateTableBadJokes do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:bad_jokes, primary_key: false) do
      add :id, :string, primary_key: true
      add :creator, :string, null: false
      add :joke, :text, null: false
      add :score, :integer, null: false

      timestamps()
    end
  end
end
