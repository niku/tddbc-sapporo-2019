defmodule Tddbc2019sapporoTest do
  use ExUnit.Case
  doctest Tddbc2019sapporo

  test "閉区間を作ることができる" do
    assert ClosedRange.new(3, 5)
  end

  describe "下端点はlower_pointで取得できる" do
    test "下端点が3のとき、3が取得できる" do
      closed_range = ClosedRange.new(3, 10)
      assert ClosedRange.lower_point(closed_range) == {:ok, 3}
    end

    test "ClosedRange以外の値が与えられた時lower_pointはエラーを返す" do
      assert ClosedRange.lower_point(5) == :error
    end
  end

  describe "上端点はupper_pointで取得できる" do
    test "上端点が3のとき、3が取得できる" do
      closed_range = ClosedRange.new(1, 3)
      assert ClosedRange.upper_point(closed_range) == {:ok, 3}
    end

    test "ClosedRange以外の値が与えられた時upper_pointはエラーを返す" do
      assert ClosedRange.upper_point(5) == :error
    end
  end
end
