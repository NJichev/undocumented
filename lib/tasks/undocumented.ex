defmodule Mix.Tasks.Undocumented do
  use Mix.Task
  @recursive true

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
