defmodule Aoc do
    def is_valid?([min, max, letter, password]) do
        nb = password |> String.graphemes |> Enum.count(& (&1 == letter))

        # Piping into Enum.member seems complicated since the pipe transfers a value into the first argument of a function.
        Enum.member?(min..max, nb)
    end

    def is_valid2?([pos1, pos2, letter, password]) do
        letter1 = String.at(password, pos1-1)
        letter2 = String.at(password, pos2-1)

        cond do
            (letter1 == letter) and (letter2 == letter) -> false
            (letter1 == letter) or (letter2 == letter) -> true
            true -> false                
        end
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
|> (Enum.map &(Aoc.parseRule/1))
|> (Enum.count &(Aoc.is_valid?/1))
|> IO.puts

# Second part
# ...
text
|> String.split("\n")
|> (Enum.map &(Aoc.parseRule/1))
|> (Enum.count &(Aoc.is_valid2?/1))
|> IO.puts