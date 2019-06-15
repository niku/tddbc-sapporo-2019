defmodule Tddbc2019sapporoTest do
  use ExUnit.Case
  import ClosedRange

  describe("~x([x,y]) でClosedRangeを生成できる") do
    test "~x([3,5]) のとき、下端点が3、上端点が5のClosedRangeを生成する" do
      assert ~x([3,5]) = ClosedRange.new(3, 5)
    end
  end

  describe "下端点はlower_pointで取得できる" do
    test "下端点が3のとき、3が取得できる" do
      assert ClosedRange.lower_point(~x([3,10])) == {:ok, 3}
    end

    test "ClosedRange以外の値が与えられた時lower_pointはエラーを返す" do
      assert ClosedRange.lower_point(5) == :error
    end
  end

  describe "上端点はupper_pointで取得できる" do
    test "上端点が3のとき、3が取得できる" do
      assert ClosedRange.upper_point(~x([1,3])) == {:ok, 3}
    end

    test "ClosedRange以外の値が与えられた時upper_pointはエラーを返す" do
      assert ClosedRange.upper_point(5) == :error
    end
  end

  describe "閉区間を文字列で取得できる" do
    test "下端点が3、上端点8の時、stringifyは[3,8]を返す" do
      assert ClosedRange.stringify(~x([3,8])) == "[3,8]"
    end

    test "ClosedRange以外の値が与えられた時stringifyはエラーを返す" do
      assert ClosedRange.stringify(3) == :error
    end
  end

  describe "閉区間が指定の値を含むか否か判定できる" do
    test "閉区間[3,8]に5を与えるとinclude?はtrueを返す" do
      assert ClosedRange.include?(~x([3,8]), 5) == true
    end

    test "閉区間[3,8]に10与えるとinclude?はfalseを返す" do
      assert ClosedRange.include?(~x([3,8]), 10) == false
    end
  end

  describe "別の閉区間と等価か判定できる" do
    test "閉区間[3,8]と閉区間[3,8]をequal?で比べるとtrueを返す" do
      assert ClosedRange.equal?(~x([3,8]), ~x([3,8])) == true
    end

    test "閉区間[3,8]と閉区間[3,9]をequal?で比べるとfalseを返す" do
      assert ClosedRange.equal?(~x([3,8]), ~x([3,9])) == false
    end

    test "閉区間[3,8]と閉区間でないものをequal?で比べるとfalseを返す" do
      assert ClosedRange.equal?(~x([3,8]), 9) == false
    end
  end

  describe "別の閉区間を完全に含むか判定できる" do
    test "閉区間[3,8]と閉区間[4,7]を与えるとsubet?はtrueを返す" do
      assert ClosedRange.subset?(~x([3,8]), ~x([4,7])) == true
    end

    test "閉区間[3,8]と閉区間[4,7]を与えるとsubet?はfalseを返す" do
      assert ClosedRange.subset?(~x([3,8]), ~x([4,9])) == false
    end
  end

  describe "上端点より下端点が大きい閉区間を作ることはできない" do
    test "下端点に6、上端点に5を与えると:errorを返す" do
      assert ~x([6,5]) == :error
    end
  end
end
