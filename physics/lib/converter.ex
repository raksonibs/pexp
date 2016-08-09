defmodule Converter do 
  def convert_to_km(velocity) do 
    velocity / 1000
  end

  def to_km(velocity) do 
    velocity / 1000
  end

  def to_meters(velocity) do 
    velocity * 1000
  end

  def to_light_seconds(arg), do: to_light_seconds(arg, precision: 5)
  def to_light_seconds({unit, val}, precision: precision) do 
    case unit do 
      :miles -> from_miles(val)
      :meters -> from_meters(val)
    end |> round_to(precision)
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9

  def to_nearest_tenth(val) do 
    Float.round(val, 1)
  end

  def seconds_to_hours(val) when is_integer(val) or is_float(val) do
    val / 3600 |> to_nearest_tenth
  end

  def round_up(val) when is_float(val), do: trunc(val)
  def round_to(val) when is_float(val), do: round_to(val, 2)
  def round_to(val) when is_integer(val), do: val
  def round_to(val, precision) when is_float(val), do: Float.round(val, precision)

end