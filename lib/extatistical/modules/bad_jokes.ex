defmodule Extatistical.Modules.BadJokes do
  @moduledoc """

  """
  import Ecto.Query

  alias Extatistical.Repo
  alias Extatistical.Schemas.BadJoke

  @doc """
  Get a bad joke by ID
  """
  def get(bad_joke_id) when is_binary(bad_joke_id) do
    from(
      m in BadJoke,
      where: m.id == ^bad_joke_id
    )
    |> Repo.one()
    |> case do
      nil ->
        {:error, :not_found}

      bad_joke ->
        {:ok, bad_joke}
    end
  end

  @doc """
  Retrieve all bad jokes
  """
  def retrieve_all() do
    from(
      m in BadJoke
    )
    |> Repo.all()
    |> case do
      [] ->
        {:error, :not_found}

      bad_jokes ->
        {:ok, bad_jokes}
    end
  end

  @doc """
  Create a bad joke
  """
  def create(attrs) when is_map(attrs) do
    %BadJoke{}
    |> BadJoke.changeset(attrs)
    |> Repo.insert()
  end
end
