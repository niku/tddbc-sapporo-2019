defmodule ClosedRange do
  defstruct [:lower, :upper]

  def new(lower, upper) do
    struct!(ClosedRange, lower: lower, upper: upper)
  end

  def lower_point(%ClosedRange{lower: lower}) do
    {:ok, lower}
  end

  def lower_point(_closed_range) do
    :error
  end

  def upper_point(%ClosedRange{upper: upper}) do
    {:ok, upper}
  end

  def upper_point(_closed_range) do
    :error
  end

  def stringify(%ClosedRange{lower: lower, upper: upper}) do
    "[#{lower},#{upper}]"
  end
end
