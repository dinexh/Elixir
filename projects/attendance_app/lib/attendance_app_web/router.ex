defmodule AttendanceAppWeb.Router do
  use AttendanceAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", AttendanceAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/calculate", PageController, :calculate
  end
end
