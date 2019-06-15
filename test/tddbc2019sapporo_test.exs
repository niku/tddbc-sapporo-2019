defmodule Tddbc2019sapporoTest do
  use ExUnit.Case

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

  describe "閉区間を文字列で取得できる" do
    test "下端点が3、上端点8の時、stringifyは[3,8]を返す" do
      closed_range = ClosedRange.new(3, 8)
      assert ClosedRange.stringify(closed_range) == "[3,8]"
    end

    test "ClosedRange以外の値が与えられた時stringifyはエラーを返す" do
      assert ClosedRange.stringify(3) == :error
    end
  end

  describe "閉区間が指定の値を含むか否か判定できる" do
    test "閉区間[3,8]に5を与えるとcontainsはtrueを返す" do
      closed_range = ClosedRange.new(3, 8)
      assert ClosedRange.contains(closed_range, 5) == true
    end

    test "閉区間[3,8]に10与えるとcontainsはfalseを返す" do
      closed_range = ClosedRange.new(3, 8)
      assert ClosedRange.contains(closed_range, 10) == false
    end
  end
end
