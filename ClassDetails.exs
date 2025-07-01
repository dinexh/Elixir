defmodule ClassDetails do
    defstruct(name: nil, age: nil)
    def details(name , age) do
      IO.puts("The Users Details : Name: #{name}, Age: #{age}")
    end
end
