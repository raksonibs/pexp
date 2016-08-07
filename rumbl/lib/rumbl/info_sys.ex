defmodule Rumbl.InfoSys do 
  @backends [Rumbl.InfoSys.Wolfram]

  defmodule Result do 
    defstruct score: 0, text: nil, url: nil, backend: nil
  end

  
end