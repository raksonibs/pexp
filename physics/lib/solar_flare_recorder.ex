defmodule SolarFlareRecorder do
    use GenServer

    def start_link do
      # creates pcors in vm binding current module to process idand an empty list )our accumlator
      GenServer.start_link __MODULE__, []
    end

    def record_flare(pid, {:flare, classification: c, scale: s} = flare) do 
      #  take data in public api and tell genserver to call process that's identified by passed in pid, gen server look through all localling running process and then send module assocated with that pid the data we specify, in this case {:record, flare}
      GenServer.call(pid, {:record, flare})
    end

    def handle_call({:record, flare}, _sender, flares) do 
      # when finds the process and module bound to it, excute handle_call function.
      # has the data passed to it, the sender, and the state accumlated so far
      # only want to drop the new flare data into the list
      flares = List.insert_at flares, -1, flare
      {:reply, :ok, flares}
    end
end