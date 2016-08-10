defmodule Choir do 
  @voices ["Bells", "Good News", "Pipe Organ", "Cellos", "Bad News"]

  def sing(val) do 
    # if moved into enum, 20 process each doing one command
    Enum.map 1..10, fn(n) -> 
      {:ok, pid} = Singer.start_link
      :timer.sleep(200)
      voice = Enum.random(@voices)
      Singer.sing_it pid, voice, val
    end
  end
end

defmodule Singer do 
  use GenServer

  def start_link do 
    GenServer.start_link(__MODULE__, [])
  end

  def sing_it(pid, data, string) do 
    GenServer.cast(pid, {:sing, data, string})
  end

  def handle_cast({:sing, voice, val}, _state) do 
    IO.puts "Singing with #{voice}"

    System.cmd "say", ["-v", voice, val]
    {:noreply, []}
  end
end