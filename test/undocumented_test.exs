defmodule UndocumentedTest do
  use ExUnit.Case
  import Undocumented

  alias UndocumentedTest.Fixtures.{NoDocs, DocFalse}

  test "returns undocumented functions for a module" do
    assert [{NoDocs, :bar, 1, _line}] = get_missing_docs(NoDocs)
  end

  test "returns empty list for modules with @moduledoc false" do
    assert [] = get_missing_docs(DocFalse)
  end
end
