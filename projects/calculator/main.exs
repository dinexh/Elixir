Code.require_file("math.ex")
Code.require_file("string_ops.ex")

IO.puts "Add : #{Math.add(5 , 3)}"
IO.puts "Subtract : #{Math.subtract(10 , 4)}"


IO.puts "Uppercase: #{StringOps.upcase("Hello")}"
IO.puts "Reverse: #{StringOps.reverse("Dinesh")}"
IO.puts "Pipline Function: #{StringOps.upcase_and_reverse("Dinesh")}"
