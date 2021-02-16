defmodule Day2 do

  def run() do
    input = parse_input()

    IO.puts "part1 result: #{main(input, part: 1)}"
    IO.puts "part2 result: #{main(input, part: 2)}"
  end

  defp main(input, part) do
    Enum.count(input, &pass_ok?(&1, part))
  end

  defp parse_line(line) do
    [amount, letter, password] = String.split(line, " ")
    [a, b] = for n <- String.split(amount, "-"), do: elem(Integer.parse(n),0)
    letter = String.first(letter)
    {a, b, letter, password}
  end

  defp pass_ok?({min_amount, max_amount, letter, password}, part: 1) do
    letter_appearance = String.graphemes(password) |> Enum.count(fn x -> x == letter end)
    letter_appearance in min_amount..max_amount
  end

  defp pass_ok?({a, b, letter, password}, part: 2) do
    (String.at(password, a - 1) == letter) != (String.at(password, b - 1) == letter)
  end

  defp parse_input() do
    File.read!("input.txt") |>
    String.split("\n", trim: true) |>
    Enum.map(&parse_line/1)
  end

end

Day2.run()
