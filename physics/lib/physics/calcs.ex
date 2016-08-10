defmodule Calcs do 
  def square_root(val), do: :math.sqrt(val)
  def squared(val), do: val * val
  def cubed(val), do: val * val * val
  def pi, do: :math.pi
  def third_root(val), do: :math.pow(val, -3)
end