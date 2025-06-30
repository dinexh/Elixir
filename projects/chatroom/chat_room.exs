# ChatRoom module manages users and messages
defmodule ChatRoom do
  def start_link do
    # Start the chat room with an empty user map
    spawn(fn -> loop(%{}) end)
  end

  defp loop(users) do
    receive do
      {:join, user_pid, username} ->
        # Send welcome message to the user
        send(user_pid, {:welcome, "Welcome #{username}!"})

        # Add the user to the chatroom state
        new_users = Map.put(users, user_pid, username)

        # Notify all users
        broadcast(new_users, "#{username} has joined the chat")
        loop(new_users)

      {:message, from_pid, msg} ->
        # Get the sender's name
        sender = Map.get(users, from_pid, "Unknown")

        # Broadcast the message
        broadcast(users, "[#{sender}] #{msg}")
        loop(users)

      {:leave, user_pid} ->
        username = Map.get(users, user_pid, "Someone")

        # Notify all users and remove the user
        broadcast(users, "#{username} has left the chat")
        loop(Map.delete(users, user_pid))
    end
  end

  defp broadcast(users, message) do
    Enum.each(users, fn {pid, _} ->
      send(pid, {:chat, message})
    end)
  end
end

# User module simulates a chat participant
defmodule User do
  def start(chatroom_pid, username) do
    # Start the user process
    spawn(fn -> loop(chatroom_pid, username) end)
  end

  defp loop(chatroom_pid, username) do
    # Join the chatroom
    send(chatroom_pid, {:join, self(), username})

    # Start listening for messages
    receive_messages(chatroom_pid, username)
  end

  defp receive_messages(chatroom_pid, username) do
    receive do
      {:welcome, msg} ->
        IO.puts("[#{username}] #{msg}")
        receive_messages(chatroom_pid, username)

      {:chat, msg} ->
        IO.puts("[#{username}] #{msg}")
        receive_messages(chatroom_pid, username)
    end
  end
end

# Simulation code
chatroom = ChatRoom.start_link()

# Start some users
user1 = User.start(chatroom, "Alice")
user2 = User.start(chatroom, "Bob")
user3 = User.start(chatroom, "Charlie")

# Simulate some messages
send(chatroom, {:message, user1, "Hey everyone!"})
send(chatroom, {:message, user2, "Hi Alice!"})
send(chatroom, {:message, user3, "Good to see you all!"})

# Simulate a user leaving
send(chatroom, {:leave, user1})

# Let processes run before exiting
:timer.sleep(1000)
