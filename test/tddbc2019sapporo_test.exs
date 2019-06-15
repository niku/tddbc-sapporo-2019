defmodule Tddbc2019sapporoTest do
  use ExUnit.Case
  doctest Tddbc2019sapporo

  test "閉区間を作ることができる" do
    assert ClosedRange.new(3, 5)
  end

  test "閉区間の下端点を取得する" do
    closed_range = ClosedRange.new(3, 5)
    assert ClosedRange.lower_point(closed_range) == 3
  end
end
