defmodule LSystem do
  def transform(string, rules) do
    transform(String.graphemes(string), rules, "")
  end

  def run(input, rules, steps) do
    (1..steps)
    |> Enum.reduce([input], fn(_step, acc=[head|_rest2]) ->
      [transform(head, rules) | acc]
    end)
    |> Enum.reverse
  end

  defp transform([], _rules, acc), do: acc
  defp transform([first_char|rest], rules, acc) do
    transform(rest, rules, acc <> transform_char(first_char, rules))
  end

  defp transform_char(char, rules) do
    rules[char] || char
  end
end
