defmodule Extatistical.MixProject do
  use Mix.Project

  def project do
    [
      app: :extatistical,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Extatistical.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
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
    ]
  end
end
