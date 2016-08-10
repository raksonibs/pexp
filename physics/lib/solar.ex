defmodule Solar do 
  def power(%{classification: :M, scale: s}), do: s * 10
  def power(%{classification: :X, scale: s}), do: s * 1000
  def power(%{classification: :C, scale: s}), do: s

  def no_eva(flares) do 
    Enum.filter flares, fn(flare) -> power(flare) > 1000 end
    # Enum.filter flares &(power(&1) > 1000)
  end

  def deadliest(flares) do 
    Enum.map(flares, &(power(&1))) |> Enum.max
  end

  def total_flare_power(list) do 
    total_flare_power(list, 0)
  end

  def total_flare_power([], total), do: total

  # def total_flare_power([ head | tail], total) do 
  #   new_total = power(head) + total 
  #   total_flare_power(tail, new_total)
  # end

  # def total_flare_power([%{classification: :M, scale: s} | tail], total) do 
  #   new_total = s * 10 * 0.92 + total
  #   total_flare_power(tail, new_total)
  # end

  # def total_flare_power(flares) do 
  #   Enum.reduce flares, 0, fn(flare, total) -> power(flare) + total end
  # end

  # def total_flare_power(flares) do 
  #   (for flare <- flares, do: power(flare)) |> Enum.sum
  # end

  def flare_list(flares) do 
    # Enum.map(flares, fn(flare) -> [power: power(flare), is_deadly: power(flare) > 1000])
    #   |> List.flatten

    Enum.map(flares, fn(flare) ->
      p = power(flare)
      {:flare, :power, p, is_deadly: p > 1000}
    end)

    # for flare <- flares, flare.classification == :X, do: %{power: power(flare), is_deadly: power(flare) > 1000}
    # for flare <- flares,
    # power <- [power(flare)],
    # is_deadly <- [power > 1000],
    # do: %{power: power, is_deadly: is_deadly}
  end
end
