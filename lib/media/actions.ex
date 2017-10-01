defmodule Media.Actions do
  @moduledoc """
  Actions that MediaIndexer can do are placed in
  this module.
  """

  import Apex

  def scan([cache_name, scan_dirs]) do
    ap cache_name
    ap scan_dirs
  end

  @doc """
  Creates a heirarchial structure of directories and their files,
  as follows:

  {".", ["a.txt",
         "b.txt",
          {"./lib", ["a.ex",
                     "b.ex",
                     "c.ex"
                     ]
           }
          ]
         }

  with the understanding that a directory is the path, with a
  collection of other files (and other directories, which are tuples).
  """

  def dir_tree(path \\ ".") do
    cond do
      File.regular?(path) -> path
      File.dir?(path) ->
        { path, 
          File.ls!(path)
          |> Enum.map(&Path.join(path, &1))
          |> Enum.map(&dir_tree(&1))
        }
    end
  end
end
