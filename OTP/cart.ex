defmodule Cart do
  use GenServer

  ## Client API

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def add_item(item) do
    GenServer.cast(__MODULE__, {:add, item})
  end

  def get_items() do
    GenServer.call(__MODULE__, :get)
  end

  def reset_cart() do
    GenServer.cast(__MODULE__, :reset)
  end

  ## Server Callbacks

  def init(_) do
    {:ok, []}
  end

  def handle_cast({:add, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_cast(:reset, _state) do
    {:noreply, []}
  end

  def handle_call(:get, _from, state) do
    {:reply, Enum.reverse(state), state}
  end
end
