defmodule LogoMapping do
  def map(string, mappings) do
    string
    |> String.graphemes
    |> Enum.map(fn(char) ->
      mappings[char]
    end)
  end
end
