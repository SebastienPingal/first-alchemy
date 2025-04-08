defmodule BasicMath do
  def add(addend_1, addend_2), do: addend_1 + addend_2

  def subtrack(minuend, subtraend) do
    minuend - subtraend
  end

  def multiply(multiplier, multiplicand) do
    multiplier * multiplicand
  end

  def divide(dividend, divisor) do
    dividend / divisor
  end

  def round(value) do
    Float.ceil(value, 2)
  end

end
