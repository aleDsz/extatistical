use Mix.Config

config :extatistical,
  ecto_repos: [Extatistical.Repo]

config :extatistical, Extatistical.Endpoint,
  port: 4000

# import_config "#{Mix.env()}.exs"
