defmodule Aoc do
    def parse(text) do
        text |> String.split("\n")
    end

    def getposition(input, column, line) do
        if (is_nil Enum.at(input, line)) do
            nil
        else
            input
            |> Enum.at(line)
            |> String.graphemes
            |> Stream.cycle
            |> Enum.at(column)
        end
    end

    def path(input, hmove, vmove) do
        Stream.unfold({hmove, vmove}, fn {x, y} ->
            case input |> Aoc.getposition(x, y) do
                "." -> {false, {x + hmove, y + vmove}}
                "#" -> {true, {x + hmove, y + vmove}}
                nil -> nil
            end
        end)
    end
    
end

{:ok, content} = File.read "input"

content
|> Aoc.parse
|> Aoc.path(3,1)
|> Enum.to_list
|> Enum.count(& &1)
|> IO.puts
