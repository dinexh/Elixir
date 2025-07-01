defmodule Library do
  defstruct title: " ", author: " "

  def bookdetails(%Library{title: t, author: a}) do
    IO.puts("#{t} by #{a}")
  end
end

book = %Library{title: "Elixir in Action", author: "Sasa Juric"}

Library.bookdetails(book)
