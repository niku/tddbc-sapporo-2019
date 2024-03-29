defmodule ClosedRange do
  defstruct [:lower, :upper]

  defmacro sigil_x({:<<>>, _meta, [string]}, _modifiers) do
    do_sigil_x(string)
    |> Macro.escape()
  end

  defp do_sigil_x(string) do
    %{"lower" => lower_string, "upper" => upper_string} =
      Regex.named_captures(~r/\[\s*(?<lower>\d+)\s*,\s*(?<upper>\d+)\s*\]/, string)

    lower = String.to_integer(lower_string)
    upper = String.to_integer(upper_string)
    new(lower, upper)
  end

  @spec new(any, any) :: :error | %{:__struct__ => atom, optional(atom) => any}
  def new(lower, upper) when lower <= upper do
    struct!(ClosedRange, lower: lower, upper: upper)
  end

  def new(_, _), do: :error

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

  def stringify(_closed_range) do
    :error
  end

  def include?(%ClosedRange{lower: lower, upper: upper}, num) when lower <= num and num <= upper,
    do: true

  def include?(_, _), do: false

  def equal?(%ClosedRange{lower: lower1, upper: upper1}, %ClosedRange{
        lower: lower2,
        upper: upper2
      })
      when lower1 == lower2 and upper1 == upper2,
      do: true

  def equal?(_, _), do: false

  def subset?(%ClosedRange{lower: lower1, upper: upper1}, %ClosedRange{
        lower: lower2,
        upper: upper2
      })
      when lower1 <= lower2 and upper2 <= upper1,
      do: true

  def subset?(_, _), do: false
end
