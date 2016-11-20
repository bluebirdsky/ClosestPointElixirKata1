ExUnit.start
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "when given list of x, y coordinates return list sorted by x" do
    coord = MapSet.new([{3.1,1}, {1.2,3}, {2.3,2.1}])

    result = ClosestPoint.sortByX(coord)

    expectedResult = [{1.2,3},{2.3,2.1},{3.1,1}];
    assert result == expectedResult
  end

end
