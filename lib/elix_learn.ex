defmodule ElixLearn do
  @my_value 12

  # Sample array stuff
  [ head | tail ] = [1, 2, 3, 4]

  if(head == 1, [do: IO.puts "OK"])
  if(tail == 0, [do: IO.puts "OK"])

  IO.puts is_number(if false do 1 else :no end)

  @doc "Hello, World!"
  def yo(name // "adam") do
    IO.puts "Hello #{name}! The number is #{@my_value}"
  end

  def check(item) do
    x = 1
    case item do
      [_ | _] ->
        IO.puts "array!"
      ^x ->
        x2 = double(x)
        "it's x! (#{x2})"
      _ ->
        IO.puts "No Match"
    end
  end

  defrecord Scores, score1: 0, score2: 0

  defprotocol ScoreCalc do
    def pass?(scores)
  end

  defimpl ScoreCalc, for: Scores do
    def pass?(scores), do:
      scores.score1 > 10 and scores.score2 > 15
  end

  defimpl ScoreCalc, for: Any do
    def pass?(scores), do: false
  end

  game1 = Scores.new(score1: 12, score2: 10)
  game2 = Scores.new(score1: 20, score2: 25)

  IO.puts "Did you pass game1? #{ScoreCalc.pass?(game1)}"
  IO.puts "Did you pass game2? #{ScoreCalc.pass?(game2)}"

  try do
    raise "some error"
  rescue
    _ -> IO.puts "caught error"
  end

  list = ["foo", "bar", "baz"]
  IO.puts (Enum.map list, size(&1))
  IO.puts (Enum.reduce [1,2,3], 1, &1 * &2)

  IO.puts "for!"
  IO.puts (lc n inlist [1,2,3,4], do: n * 2)

  defp double(n) do
    if is_number(n) do
      n * 2
    else
      0
    end
  end
end

ElixLearn.yo()
ElixLearn.yo("dave")
ElixLearn.check(1)
ElixLearn.check(10)
ElixLearn.check([1,2, 4])
ElixLearn.check("")
ElixLearn.check(false)
