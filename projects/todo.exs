defmodule Todo do
  def start(tasks \\ []) do
    IO.puts("\n== To-Do List ==")
    IO.puts("1. Add Task")
    IO.puts("2. List Tasks")
    IO.puts("3. Delete Task")
    IO.puts("4. Quit")

    choice = IO.gets("Choose an option: ") |> String.trim()

    case choice do
      "1" ->
        task = IO.gets("Enter the task: ") |> String.trim()
        start(tasks ++ [task])

      "2" ->
        IO.puts("\nAll the tasks:")
        Enum.with_index(tasks, 1)
        |> Enum.each(fn {task, i} ->
          IO.puts("#{i}. #{task}")
        end)
        start(tasks)

      "3" ->
        IO.puts("\nAll the tasks:")
        Enum.with_index(tasks, 1)
        |> Enum.each(fn {task, i} ->
          IO.puts("#{i}. #{task}")
        end)

        index_input = IO.gets("Enter task number to delete: ") |> String.trim()

        case Integer.parse(index_input) do
          {index, _} when index > 0 and index <= length(tasks) ->
            new_tasks = List.delete_at(tasks, index - 1)
            IO.puts("Task deleted.")
            start(new_tasks)

          _ ->
            IO.puts("Invalid number.")
            start(tasks)
        end

      "4" ->
        IO.puts("Goodbye!")
        :ok

      _ ->
        IO.puts("Invalid choice.")
        start(tasks)
    end
  end
end

Todo.start()
