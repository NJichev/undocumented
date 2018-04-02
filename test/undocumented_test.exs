defmodule UndocumentedTest do
  use ExUnit.Case

  alias UndocumentedTest.Fixtures.NoDocs

  describe "for/1" do
    test "returns undocumented functions for a module" do
      assert Undocumented.of(NoDocs) == [{{:bar, 1}, 6}]
    end
  end
end
