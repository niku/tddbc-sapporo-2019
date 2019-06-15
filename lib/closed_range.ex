defmodule ClosedRange do
  defstruct [:lower, :upper]

  def new(lower, upper) do
    struct!(ClosedRange, lower: lower, upper: upper)
  end

  def lower_point(%ClosedRange{lower: lower} = closed_range) do
    {:ok, lower}
  end

  def lower_point(closed_range) do
    :error
  end
end
