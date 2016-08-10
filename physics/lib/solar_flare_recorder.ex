defmodule SolarFlareRecorder do
    use GenServer

#   task = Task.async(SolarFlareRecorder.record_flare(flare))
# #that could take a while, so let's do some other things
# #...
# #now that we're done, let's check our task and wait for the result
# result = Task.await(task)

    def start_link do
      # creates pcors in vm binding current module to process idand an empty list )our accumlator
      # GenServer.start_link __MODULE__, []
      Agent.start_link fn -> [] end
    end

    def record_flare(pid, {:flare, classification: c, scale: s} = flare) do 
      #  take data in public api and tell genserver to call process that's identified by passed in pid, gen server look through all localling running process and then send module assocated with that pid the data we specify, in this case {:record, flare}
      # GenServer.call(pid, {:record, flare})
      Agent.get_and_update pid, fn(flares) -> 
        new_state = List.insert_at flares, -1, flare 
        {:ok, new_state}
      end
    end

    def get_flares(pid) do 
      Agent.get pid, fn(flares) ->
        flares 
      end
    end

    # def handle_call({:record, flare}, _sender, flares) do 
    #   # when finds the process and module bound to it, excute handle_call function.
    #   # has the data passed to it, the sender, and the state accumlated so far
    #   # only want to drop the new flare data into the list
    #   # flares = List.insert_at flares, -1, flare
    #   # {:reply, :ok, flares}
    # end
end