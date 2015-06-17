defmodule Sierpinski do
  import Logo.Instance

  # L System
  @rules %{
    "A" => "B-A-B",
    "B" => "A+B+A"
  }
  @axiom "A"

  # Logo mappings
  @angle 58
  @distance 5
  @mappings %{
    "A" => {:forward, [@distance]},
    "B" => {:forward, [@distance]},
    "-" => {:right, [@angle]},
    "+" => {:left, [@angle]}
  }

  def run(steps) do
    runs = LSystem.run(@axiom, @rules, steps)
    [output|_] = Enum.reverse(runs)
    moves = LogoMapping.map(output, @mappings)
    {:ok, turtle} = Logo.Instance.start

    turtle
    |> move_to({300, 300})
    |> color({255, 0, 0})
    |> pen_down

    for {fun, args} <- moves do
      apply(Logo.Instance, fun, [turtle] ++ args)
    end

    IO.inspect Logo.Instance.get_turtle(turtle)

    Logo.Window.start(turtle)
  end
end

Sierpinski.run 7
