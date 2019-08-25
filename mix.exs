defmodule Extatistical.MixProject do
  use Mix.Project

  def project do
    [
      app: :extatistical,
      version: "1.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Extatistical.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # API
      {:plug, "~> 1.8"},
      {:plug_cowboy, "~> 2.1"},
      {:cowboy, "~> 2.6"},
      {:poison, "~> 4.0"},

      # Database
      {:myxql, ">= 0.0.0"},
      {:ecto, "~> 3.1"},
      {:ecto_sql, "~> 3.1"}
    ]
  end

  defp aliases do
    [
      setup: ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate --quiet", "run priv/repo/seeds.exs"]
    ]
  end
end
