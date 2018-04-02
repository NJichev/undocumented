defmodule Undocumented do
  def report do
    project_modules()
    |> Enum.flat_map(&of/1)
  end

  def of(module) when is_atom(module) do
    missing_docs(module)
  end

  defp missing_docs(module) do
    for {{f, arity}, line, _kwd, _ctx, nil} <- Code.get_docs(module, :docs) do
      {f, arity, line, module}
    end
  end

  defp missing_moduledocs(module) do
    case Code.get_docs(module, :moduledocs) do
      docs = {_line, false} -> [docs]
      _ -> []
    end
  end

  @elixir_module "Elixir*.beam"
  def project_modules do
    path = Mix.Project.compile_path()

    [path, @elixir_module]
    |> Path.join()
    |> Path.wildcard()
    |> Enum.map(&extract_module(&1, path))
    |> Enum.map(&String.to_existing_atom/1)
  end

  defp extract_module(module, path_to_remove) do
    module
    |> String.replace(".beam", "")
    |> String.replace(path_to_remove, "")
    |> String.replace("/", "")
  end
end
