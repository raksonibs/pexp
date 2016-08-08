defmodule Converter do 
  def to_km(velocity) do 
    velocity / 1000
  end

  def to_light_seconds({:miles, miles} = val, precision: precision) do 
    (miles * 5.36818e-6) |> round_up
  end

  def to_nearest_tenth(val) do 
    Float.round(val, 1)
  end

  def to_light_seconds({:meters, meters} = val, precision: precision) do 
    (meters * 3.335638620368e-9) |> round_up
  end

  def round_up(val) when is_float(val), do: trunc(val)

end