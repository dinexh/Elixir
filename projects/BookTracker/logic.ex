defmodule BookLogic do
  def add_book(books, title, author) do
    [%{title: title, author: author} | books]
  end

  def list_books([]), do: IO.puts("No books found.")

  def list_books(books) do
    IO.puts("Books:")
    Enum.each(books, fn %{title: t, author: a} ->
      IO.puts("- #{t} by #{a}")
    end)
  end

  def search_book(books, title) do
    case Enum.find(books, fn %{title: t} -> t == title end) do
      nil -> IO.puts("Book not found.")
      %{title: t, author: a} -> IO.puts("Found: #{t} by #{a}")
    end
  end

  def delete_book(books, title) do
    {found, rest} = Enum.split_with(books, fn %{title: t} -> t == title end)

    case found do
      [] ->
        IO.puts("Book not found.")
        books
      _ ->
        IO.puts("Book deleted.")
        rest
    end
  end
end
