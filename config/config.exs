use Mix.Config

config :mnesia,
  dir: '~/.media_indexer/data' # TODO: Automate the creation

config :media_indexer,
  dir: '~/.media_indexer',
  db_loc: 'data' # mnesia DB above
