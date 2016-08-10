defmodule Faker do 
  import Calcs
  import Converter
  require IEx

  def paragraph(num_words \\ 100) do 
    paragraph(num_words, [])
  end

  def paragraph(num_words, total_words) when num_words == 0 do
   Enum.join(total_words, " ")
  end

  def paragraph(num_words, total_words) when num_words > 0 do 
    given_word = word
    paragraph(num_words - 1, total_words ++ [given_word])
  end

  def word do
    random(100000)
      |> round_up
      |> to_string_binary
  end

  def to_string_binary(x) do 
    Integer.to_string(x, 36)
  end

end

