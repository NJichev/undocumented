defmodule Undocumented do
  @moduledoc """
  Undocumented provides means of getting the missing documentation of a
  mix project. The way to use it running the mix task.

  Undocumented works by retrieving the current project's compile path
  and fetching all compiled elixir modules. For this it uses the
  `Mix.Project` module and the `Code.get_docs/1` function.

  ## Example:
      $ mix undocumented
  """

  @doc """
  Returns missing documentation for a project by retrieving the modules
  of a project and fetches each modules' missing docs by using
  `get_missing_docs/1`.
  """
  def report do
    project_modules()
    |> Enum.flat_map(&get_missing_docs/1)
  end

  @doc """
  Returns the missing documentation of a module using `Code.get_docs/1`.
  """
  def get_missing_docs(module) do
    for {{function, arity}, line, _, _, nil} <- Code.get_docs(module, :docs) do
      {module, function, arity, line}
    end
  end

  defp project_modules do
    Mix.Project.compile_path()
    |> Path.join("Elixir.*.beam")
    |> Path.wildcard()
    |> Enum.map(&convert_to_module/1)
  end

  defp convert_to_module(path_to_module) do
    path_to_module
    |> String.split("/")
    |> List.last()
    |> String.replace(".beam", "")
    |> String.to_existing_atom()
  end
end
