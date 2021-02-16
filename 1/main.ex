defmodule Day1 do
  def part1(numbers) do
    Enum.each(numbers, fn(a) ->
      Enum.each(numbers, fn(b) ->
        if a+b==2020 do
          IO.puts "part1 result: #{a*b}"
        end
      end)
    end)
  end

  def part2(numbers) do
    Enum.each(numbers, fn(a) ->
      Enum.each(numbers, fn(b) ->
        Enum.each(numbers, fn(c) ->
          if a+b+c==2020 do
            IO.puts "part2 result: #{a*b*c}"
          end
        end)
      end)
    end)

  end

end


{:ok, input} = File.read("input.txt")
numbers = String.split(input, "\n")
numbers = for n <- numbers, n != "", do: elem(Integer.parse(n),0)

Day1.part1(numbers)
Day1.part2(numbers)
