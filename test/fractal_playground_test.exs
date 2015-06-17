defmodule FractalPlaygroundTest do
  use ExUnit.Case

  @example1 %{
    "A" => "AB",
    "B" => "A"
  }

  @example1_expected [
    {1, "A", "AB"},
    {2, "AB", "ABA"},
    {3, "ABA", "ABAAB"},
    {4, "ABAAB", "ABAABABA"},
    {5, "ABAABABA", "ABAABABAABAAB"},
    {6, "ABAABABAABAAB", "ABAABABAABAABABAABABA"},
    {7, "ABAABABAABAABABAABABA", "ABAABABAABAABABAABABAABAABABAABAAB"}
  ]

  @example1_expected
  |> Enum.each fn({step_number, input, expected_output}) ->
    @input input
    @expected_output expected_output
    test "[Example 1] n = #{step_number}" do
      assert LSystem.transform(@input, @example1) == @expected_output
    end
  end

  test "[Example 1] n = 1" do
    assert LSystem.transform("A", @example1) == "AB"
  end

  test "[Example 1] Run for 7 steps, collecting the output" do
    expected = @example1_expected
               |> Enum.map(fn({_, _, expected_output}) -> expected_output end)
    assert LSystem.run("A", @example1, 7) == ["A" | expected]
  end

  @example2 %{
    "1" => "11",
    "0" => "1[0]0"
  }

  @example2_expected [
    {1, "0", "1[0]0"},
    {2, "1[0]0", "11[1[0]0]1[0]0"},
    {3, "11[1[0]0]1[0]0", "1111[11[1[0]0]1[0]0]11[1[0]0]1[0]0"}
  ]

  @example2_expected
  |> Enum.each fn({step_number, input, expected_output}) ->
    @input input
    @expected_output expected_output
    test "[Example 2] n = #{step_number}" do
      assert LSystem.transform(@input, @example2) == @expected_output
    end
  end
end
