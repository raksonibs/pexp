defmodule Rumbl.InfoSys.Supervisor do 
  use Supervisor 

  def start_link() do
    # __MODULE__ is current cmodule's name, initial state of empry list, and mass name option 
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_opts) do 
    children = [
      worker(Rumbl.InfoSys, [], restart: :temporary)
    ]

    supervise children, strategy: :simple_one_for_one
  end
end