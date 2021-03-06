defmodule Physics.Rocketry do
  import Calcs
  import Physics.Laws
  import Planet
  import Converter
  
  # def force_calc(planet) when is_map(planet) do 
  #   planet 
  #     |> calculate_force
  #     |> Converter.to_velocity
  #     |> Converter.round_to
  # end

  # defp calculate_ortbital_distance_equation(mass, radius) do 
  #   newtons_gravitational_constant * mass / radius |> square_root
  # end

  # defp general_equation_circular_motion(%{mass: mass, radius: radius}) do 
  #       calculate_ortbital_distance_equation(mass, radius)
  #       |> ( squared ) / radius
  # end

  def orbital_radius_calc(time) do
    newtons_gravitational_constant * Planet.planets[:earth].mass * (time |> squared) / 4 * (pi |> squared)
      |> third_root
      |> convert_to_km
  end

  def orbital_acceleration(height) do 
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_term(height) do 
    4 * (pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * Planet.planets[:earth].mass)
      |> square_root
      |> seconds_to_hours
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do 
    2 * newtons_gravitational_constant * mass /radius 
      |> square_root
  end

  def orbital_speed(height) do 
    newtons_gravitational_constant * Planet.planets[:earth].mass / orbital_radius(height)
      |> square_root
  end

  defp orbital_radius(height) do
      Planet.planets[:earth].radius + (height |> to_meters)
  end
end