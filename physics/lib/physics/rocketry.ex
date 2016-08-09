defmodule Physics.Rocketry do
  import Calcs
  import Physics.Laws
  import Planets
  import Converter
  
  def force_calc(planet) when is_map(planet) do 
    planet 
      |> calculate_force
      |> Converter.to_velocity
      |> Converter.round_to
  end
  
  def escape_velocity(:moon) do 
    moon |> escape_velocity
  end

  def escape_velocity(:earth) do 
    earth |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do 
    planet 
      |> calculate_escape
      |> Converter.convert_to_km
      |> Converter.round_to
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do 
    2 * newtons_gravitational_constant * mass /radius 
      |> square_root
  end
end