defmodule Extatistical.Schemas.BadJoke do
  @moduledoc """

  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}

  schema "bad_jokes" do
    field :creator, :string
    field :joke, :string
    field :score, :integer

    timestamps()
  end

  @doc """

  """
  def changeset(%__MODULE__{} = schema, attrs) when is_map(attrs) do
    schema
    |> cast(attrs, [:creator, :joke, :score])
    |> put_change(:id, Ecto.UUID.generate())
    |> validate_required([:creator, :joke, :score])
  end
end
