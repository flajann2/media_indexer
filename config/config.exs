use Mix.Config

config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}

config :mnesia,
  dir: '~/.media_indexer/data' # TODO: Automate the creation

config :media_indexer,
  dir: '~/.media_indexer',
  db_loc: 'data' # mnesia DB above

