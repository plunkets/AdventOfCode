defmodule Aoc do
    def is_valid?([min, max, letter, password]) do
        nb = password |> String.graphemes |> Enum.count(& (&1 == letter))

        # Piping into Enum.member seems complicated since the pipe transfers a value into the first argument of a function.
        Enum.member?(min..max, nb)
    end

    def parseRule(chaine) do
        [min, max, letter, password] = (chaine |> String.replace(":","") |> String.replace("-"," ") |> String.split(" "))

        # Ugly repeat 
        [String.to_integer(min), String.to_integer(max), letter, password]
    end
end

{:ok, text} = File.read "input"

text
|> String.split("\n")
|> (Enum.map &(Aoc.parseRule &1))
|> (Enum.count &(Aoc.is_valid?/1))
|> IO.puts

# Second part
# ...