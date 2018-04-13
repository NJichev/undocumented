defmodule Mix.Tasks.Undocumented do
  @moduledoc """
  The mix tasks that provides `mix undocumented` command.

  Uses `Undocumented.report/0` to retrieve missing docs and
  formats it to get some nice errors.
  """

  use Mix.Task
  @recursive true

  @doc false
  def run(_) do
    Mix.Task.run("compile")

    Undocumented.report()
    |> check!()
  end

  defp check!([]), do: :ok

  defp check!(report) do
    Mix.raise("""
    mix undocumented failed
    Found missing documentation for:

    #{to_bullet_list(report)}
    """)
  end

  defp to_bullet_list(report) do
    Enum.map_join(report, "\n", &"  * #{format(&1)}")
  end

  defp format({f, a, l, m}) do
    "#{inspect(m)}.#{f}/#{a} on line #{l}"
  end
end
