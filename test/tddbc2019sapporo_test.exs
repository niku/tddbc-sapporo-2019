defmodule Tddbc2019sapporoTest do
  use ExUnit.Case
  doctest Tddbc2019sapporo

  test "閉区間を作ることができる" do
    assert ClosedRange.new(3, 5)
  end
end
