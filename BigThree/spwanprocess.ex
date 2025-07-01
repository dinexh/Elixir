defmodule HelloProcess do
  def say_hello do
    :timer.sleep(500)  # Give it half a second delay
    IO.puts("Hello from process #{inspect(self())}")
  end
end

_pid = spawn(HelloProcess, :say_hello, [])

# Sleep the main process so the spawned process gets time to run
:timer.sleep(1000)
