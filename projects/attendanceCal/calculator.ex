defmodule Calculator do
  def attendance_percentage(attended, total) do
    (attended / total) * 100
  end

  def status(percentage) do
    cond do
      percentage >= 75 -> "You're safe ✅"
      percentage >= 65 -> "Caution! Improve attendance ⚠️"
      true -> "Shortage! Attend more classes ❌"
    end
  end
end
