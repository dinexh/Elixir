defmodule DaysFinder do
  def finder do
    month = IO.gets("Enter month (1-12): ") |> String.trim() |> String.to_integer()
    year = IO.gets("Enter year: ") |> String.trim() |> String.to_integer()

    last_thursday = get_last_thursday(year, month)
    IO.puts("Last Thursday of #{month}/#{year} is on: #{Date.to_string(last_thursday)}")
  end

  def get_last_thursday(year, month) do
    last_day = Date.new!(year, month, :calendar.last_day_of_the_month(year, month))
    find_last_thursday(last_day)
  end

  defp find_last_thursday(date) do
    if Date.day_of_week(date) == 4 do
      date
    else
      find_last_thursday(Date.add(date, -1))
    end
  end
end
