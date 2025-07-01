defmodule DayFinder do
  defstruct [:year, :month]
  def finder() do
    year = IO.gets("Enter year: ") |> String.trim() |> String.to_integer()
    month = IO.gets("Enter month: ") |> String.trim() |> String.to_integer()
    last_day = :calendar.last_day_of_the_month(year, month)
    last_thursday = Enum.find(last_day..1//-1, fn day ->
      {:ok, date} = Date.new(year, month, day)
      Date.day_of_week(date) == 4
    end)
    IO.puts("Last Thursday is on: #{year}-#{pad(month)}-#{pad(last_thursday)}")
  end

  defp pad(n) when n < 10, do: "0#{n}"
  defp pad(n), do: "#{n}"
end

DayFinder.finder()
