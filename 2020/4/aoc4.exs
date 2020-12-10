defmodule Aoc do
    def formatfile(input) do
        input |> String.split("\r\n\r\n", trim: true)
    end
    def formatline(input) do
        input
        |> String.replace("\r\n", ":")
        |> String.replace(" ",":")
    end
    def toMap(input) do
        input
        |> String.split(":")
        |> Enum.chunk_every(2)
        |> Map.new(fn [key, value] -> {key, value} end)
    end
    def formatMapKeys(input) do
        input
        |> Map.keys
        |> Enum.sort
        |> Enum.reject(fn x -> x == "cid" end)
    end
    def isvalid?(input) do
        (input |> Aoc.formatMapKeys) == ["byr", "ecl", "eyr", "hcl", "hgt", "iyr", "pid"]
    end
end

{_, content} = File.read "input3"

content
|> Aoc.formatfile
|> Enum.map(&Aoc.formatline/1)
|> Enum.map(&Aoc.toMap/1)
|> Enum.map(&Aoc.isvalid?/1)
|> Enum.count(&(&1))
|> IO.inspect
