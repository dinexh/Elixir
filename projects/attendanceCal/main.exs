Code.require_file("calculator.ex")
Code.require_file("input.ex")

name = UserInput.get_string("Enter your name: ")
subject = UserInput.get_string("Enter subject name: ")
attended = UserInput.get_integer("Enter number of classes attended: ")
total = UserInput.get_integer("Enter total number of classes conducted: ")

percentage = Calculator.attendance_percentage(attended, total)
status = Calculator.status(percentage)

IO.puts("\n--- Attendance Report ---")
IO.puts("Name: #{name}")
IO.puts("Subject: #{subject}")
IO.puts("Attendance: #{attended}/#{total}")
IO.puts("Percentage: #{Float.round(percentage, 2)}%")
IO.puts("Status: #{status}")
