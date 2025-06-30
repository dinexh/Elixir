defmodule UserInput do
  def get_string(prompt) do
    IO.write(prompt)                      # show prompt
    input = IO.gets("")                   # read input
    case input do
      nil -> get_string(prompt)          # retry if no input (edge case)
      _ -> String.trim(input)            # clean up
    end
  end

  def get_integer(prompt) do
    input = get_string(prompt)
    case Integer.parse(input) do
      {num, _} -> num
      :error ->
        IO.puts("Invalid number. Try again.")
        get_integer(prompt)
    end
  end
end
