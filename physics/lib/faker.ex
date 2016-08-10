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
    given_word = (word |> check_last_word_period(total_words))
    paragraph(num_words - 1, total_words ++ [given_word])
  end

  def word do
    random()
      |> round_up
      |> to_string_binary
  end

  def to_string_binary(x) do 
    Integer.to_string(x, 36)
      |> String.downcase
      |> put_period
  end

  def put_period(word) do 
    String.last(word) == "A"
      |> "#{word}."
  end

  def check_last_word_period(total_words, word) do
    # how to get around this if?
    # if (Enum.at(total_words, -1).last) == "." do
    check_capital(total_words)
      |> maybe_do_something(word)
  end

  def check_capital([]) do 
    false
  end

  def check_capital(false) do 
    false
  end

  def check_capital([ head | tail]) do 
    tail.last.last == "."
  end


  def maybe_do_something(true, word) do
    String.capitalize(word)
  end

  def maybe_do_something(false, word) do 
    word
  end

end

