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
end
