defmodule Calculator do

  def find_pourcentage_of_value(percentage, value) do
    # dec_percent = BasicMath.divide(percentage, 100)
    # BasicMath.multiply(dec_percent, value)
    percentage
    |> BasicMath.divide(100)
    |> BasicMath.multiply(value)
    |> BasicMath.round()
  end

  def find_distance_travel(speed, time) do
    # speed = distance / time
    # distance = speed * time

    speed
    |> BasicMath.multiply(time)
  end

end
