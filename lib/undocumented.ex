defmodule Undocumented do
  def report do
    project_modules()
    |> Enum.flat_map(&get_missing_docs/1)
  end

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
