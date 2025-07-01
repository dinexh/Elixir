defmodule GenServerCounter do
  use GenServer
  # this basically starts the GenServer and says to that , u have started and start running then written functions
  def start_link(_agrs) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end
  def increment do

    GenServer.cast(__MODULE__, :inc)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  # how server communicates
  def init (initial_state) do
    {:ok, initial_state}
  end
  def handle_cast(:inc, current_count) do
    {:noreply, current_count+1}
  end
  def handle_call(:get, _from, current_count) do
    {:reply, current_count , current_count}
  end
end
