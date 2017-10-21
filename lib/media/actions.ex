defmodule Media.Actions do
  @moduledoc """
  Actions that MediaIndexer can do are placed in
  this module.
  """

  import Apex
  import IO
  alias Media.Worker

  def scan([cache_name, scan_dirs]) do
    for dir <- scan_dirs, do: dir_tree(dir) |> scan_trees
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

  @doc """
  Here, we spawn children to process the files.
  A supervisor shall be started for every tuple, to process
  the list of files, and if a tuple is in that list, it shall
  spawn a new supervisior to process the list of files there,
  in recursive fashion.
  """
  def scan_trees({path, list}) do
    puts "processing path #{path}"
    Enum.each(list, fn(ele) ->
      case ele do
        {npath, nlist} -> scan_trees({npath, nlist})
        file -> Worker.scan_file(file)      
      end
    end)  
  end  
end
