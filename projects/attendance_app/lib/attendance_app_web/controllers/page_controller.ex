defmodule AttendanceAppWeb.PageController do
  use AttendanceAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def calculate(conn, %{
        "name" => name,
        "subject" => subject,
        "attended" => attended,
        "total" => total
      }) do
    {attended_int, _} = Integer.parse(attended)
    {total_int, _} = Integer.parse(total)
    percent =
      if total_int == 0, do: 0, else: Float.round(attended_int * 100 / total_int, 2)

    render(conn, "result.html",
      name: name,
      subject: subject,
      percent: percent
    )
  end
end
