defmodule Messenger do
  def listen do
    receive do
      {:ping, sender} ->
        IO.puts("Got ping from #{inspect(sender)}")
        send(sender, :pong)
    end
  end
end

# Start the listening process
pid = spawn(Messenger, :listen, [])

# Send it a message
send(pid, {:ping, self()})

# Wait for a reply
receive do
  :pong -> IO.puts("Got pong back!")
after
  1000 -> IO.puts("No response in 1 second")
end
