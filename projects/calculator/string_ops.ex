defmodule StringOps do
  def upcase(str), do: String.upcase(str)
  def upcase_and_reverse(str), do: str |> String.upcase() |> String.reverse()
  def reverse(str), do: String.reverse(str)
end
