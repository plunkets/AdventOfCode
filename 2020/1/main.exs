{:ok, text} = File.read "input"

intList = text |> (String.split "\n") |> (Enum.map &(String.to_integer &1))

# First part
(for a <- intList, b <- intList, a + b == 2020, a != b, do: a * b) |> hd |> IO.puts

# Second part
(for a <- intList, b <- intList, c <- intList, a + b + c == 2020, a != b, b != c, do: a * b * c) |> hd |> IO.puts

