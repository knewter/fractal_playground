defmodule LogoMappingTest do
  use ExUnit.Case

  @mappings %{
    "A" => {:forward, [10]},
    "-" => {:right, [30]},
    "B" => {:forward, [10]},
    "+" => {:left, [30]},
  }

  test "maps an alphabet to logo function calls" do
    #assert [{:forward, [10]}, {:turn_right, [90]}] = LogoMapping.map("1[0")
    assert [
      {:forward, [10]},
      {:right, [30]},
      {:forward, [10]},
      {:left, [30]}
    ] = LogoMapping.map("A-B+", @mappings)
  end
end
