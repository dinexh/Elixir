# Named functions inside a module
# MyFunction is like a class and def greet is like a method inside a class (function)

# defmodule MyFunction do
#   def greet(name) do
#     "Hello , #{name}!"
#   end
# end

# IO.puts(MyFunction.greet(Dinesh))


# anonymus functions similar to arrow function
# we store the value in add and we call the function add.(. .)
# add = fn a, b -> a + b end
# IO.puts add.(10,5)



# pipelines for clean functions
# |> the first one output is the input of the next one
# IO.puts(
# "Hello"
# |> String.upcase()
# |> String.reverse()
# )

# case Control Sctrutures (Paterrn matching with case)
# IO.puts(
# case {1 , 2} do
#   {1 , x } -> "Matched with #{x}"
#   _-> "No Match"
# end
# )

# Overall
defmodule Demo do
  def greet(name) do
    "Hello, #{name}!"
  end

  def calculate(x, y) do
    sum = fn a, b -> a + b end
    sum.(x, y)
  end

  def run_pipeline(str) do
    str
    |> String.upcase()
    |> String.reverse()
  end
end

IO.puts Demo.greet("Dinesh")
IO.puts Demo.calculate(5, 7)
IO.puts Demo.run_pipeline("elixir")
