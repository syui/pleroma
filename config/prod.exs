use Mix.Config

config :pleroma, Pleroma.Web.Endpoint,
 http: [port: {:system, "PORT"}],
  #url: [scheme: "https", host: "pleroma.syui.cf", port: 443],
  url: [scheme: "https", host: System.get_env("LOCAL_DOMAIN"), port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  #cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :logger, level: :info
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20

config :pleroma, Pleroma.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true


