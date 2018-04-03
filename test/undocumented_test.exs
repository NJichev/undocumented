defmodule UndocumentedTest do
  use ExUnit.Case
  import Undocumented

  alias UndocumentedTest.Fixtures.NoDocs

  test "returns undocumented functions for a module" do
    assert [{NoDocs, :bar, 1, _line}] = get_missing_docs(NoDocs)
  end
end
