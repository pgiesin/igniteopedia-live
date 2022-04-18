import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :igniteopedia_live, IgniteopediaLiveWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "RQGMChazzpm8HyCe+jzeDmFuIXrAHGwtJ0CU7hux/NIq2jSXstfjruCSvvGgMVwl",
  server: false

# In test we don't send emails.
config :notify_manager, NotifyManager.Impl.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
