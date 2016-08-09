defmodule Planets do 
  defstruct [
    name: "Earth",
    radius_m: 6.371e6,
    mass_kg: 5.97e24
  ]

  def earth, do: %{mass: 7.35e22, radius: 1.738e6}
  def mars, do: %{mass: 6.39e23, radius: 3.4e6}
  def moon, do: %{mass: 5.972e24, radius: 6.371e6}
end