defmodule UndocumentedTest.Fixtures.NoDocs do
  @doc """
  Yay I have some documentation.
  """
  def foo, do: :ok
  def bar(_), do: :ok

  defp baz, do: :ok
end
