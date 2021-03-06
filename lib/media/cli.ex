defmodule Media.Cli do
  @moduledoc """
  Defines the CLI commands and options.
  """

  def parse_args(args) do
    Optimus.new!(
      name: "mediax",
      description: "Media Indexer",
      version: "0.0.1",
      author: "Fred mitchell fred.mitchell@gmx.de",
      about: "Scan all your media files and documents, index them for searching.",
      allow_unknown_args: false,
      parse_double_dash: false,
      subcommands: [
        scan: [
          name: "scan",
          about: "Scan the given directories for content and metadata",
          allow_unknown_args: true,
          parse_double_dash: false,
          args: [
            cache: [
              value_name: "CACHE_NAME",
              help: "name of cache to create",
              required: true,
              parser: :string,
            ],            
          ],
        ],
        search: [
          name: "search",
          about: "search the database for content",
          allow_unknown_args: true,
          parse_double_dash: false,
          args: [],
        ],
        drop: [
          name: "drop",
          about: "drop the named media cache",
          args: [
            cache: [
              value_name: "CACHE_NAME",
              help: "name of cache to drop",
              required: true,
              parser: :string,
            ],
          ],
        ],
        list: [
          name: "list",
          about: "list the content of the media caches",
          allow_unknown_args: true,
          parse_double_dash: false,
          args: [],
        ],
      ],
      flags: [
        verbosity: [
          short: "-v",
          help: "Verbosity level",
          multiple: true,
        ],
      ]
    ) |> Optimus.parse!(args)
  end
end
