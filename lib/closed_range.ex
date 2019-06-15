defmodule ClosedRange do
  defstruct [:lower, :upper]

  def new(lower, upper) do
    struct!(ClosedRange, lower: lower, upper: upper)
  end
end
