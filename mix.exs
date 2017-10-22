defmodule MediaIndexer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :media_indexer,
      version: "0.0.1",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      escript: [main_module: MediaIndexer,
                name: "mediax",
                path: "./bin/mediax"],
      deps: deps()
    ]
  end

  def application do
    [
      mod: {MediaApp, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:apex, "~> 1.0"},
      {:amnesia, "~> 0.2"},
      {:optimus, "~> 0.1"},
      {:mox, "~> 0.1", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:sh, "~> 1.1"},
    ]
  end
end
