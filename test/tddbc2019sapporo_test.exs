defmodule Tddbc2019sapporoTest do
  use ExUnit.Case
  doctest Tddbc2019sapporo

  test "閉区間を作ることができる" do
    assert ClosedRange.new(3, 5)
  end

  describe "下端点はlower_pointで取得できる" do
    test "下端点が3のとき、3が取得できる" do
      closed_range = ClosedRange.new(3, 10)
      assert ClosedRange.lower_point(closed_range) == 3
    end

    test "下端点が5のとき、5が取得できる" do
      closed_range = ClosedRange.new(5, 10)
      assert ClosedRange.lower_point(closed_range) == 5
    end
  end
end
