defmodule ConverterTest do
  use ExUnit.Case  

  test "Converter to light seconds" do
    converted = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert converted == 0.00537
  end
end
