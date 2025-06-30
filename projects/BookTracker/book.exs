Code.require_file("logic.ex")

defmodule BookApp do
  def start do
    loop([])
  end

  defp loop(books) do
    IO.puts("\n Book Tracker")
    IO.puts("1. Add Book")
    IO.puts("2. List Books")
    IO.puts("3. Search Book")
    IO.puts("4. Delete Book")
    IO.puts("5. Exit")

    input = IO.gets("Choose option: ") |> String.trim()

    case input do
      "1" ->
        title = IO.gets("Enter title: ") |> String.trim()
        author = IO.gets("Enter author: ") |> String.trim()
        new_books = BookLogic.add_book(books, title, author)
        loop(new_books)

      "2" ->
        BookLogic.list_books(books)
        loop(books)

      "3" ->
        title = IO.gets("Enter title to search: ") |> String.trim()
        BookLogic.search_book(books, title)
        loop(books)

      "4" ->
        title = IO.gets("Enter title to delete: ") |> String.trim()
        new_books = BookLogic.delete_book(books, title)
        loop(new_books)

      "5" ->
        IO.puts("👋 Bye!")
        :ok

      _ ->
        IO.puts("Invalid choice")
        loop(books)
    end
  end
end

BookApp.start()
