defmodule Messenger do
  def listen do
    receive do
      {:hello, sender} ->
        IO.puts("Got hello from #{inspect(sender)}")
    end
  end
end

pid = spawn(Messenger, :listen, [])

send(pid, {:hello, self()})
