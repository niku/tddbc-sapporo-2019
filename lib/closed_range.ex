defmodule ClosedRange do
  defstruct [:lower, :upper]

  def new(lower, upper) do
    struct!(ClosedRange, lower: lower, upper: upper)
  end

  def lower_point(closed_range) do
    {:ok, closed_range.lower}
  end
end
