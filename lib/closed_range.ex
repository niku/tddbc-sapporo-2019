defmodule ClosedRange do
  defstruct [:lower, :upper]

  def new(lower, upper) do
    struct!(ClosedRange, lower: lower, upper: upper)
  end

  def lower_point(%ClosedRange{lower: lower} = _closed_range) do
    {:ok, lower}
  end

  def lower_point(_closed_range) do
    :error
  end

  def upper_point(%ClosedRange{upper: upper} = _closed_range) do
    {:ok, upper}
  end

  def upper_point(_closed_range) do
    :error
  end
end
