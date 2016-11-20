ExUnit.start
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "when given list of x, y coordinates, return list sorted by x" do
    coordListMap = MapSet.new([{3.1,1}, {1.2,3}, {2.3,2.1}])

    result = ClosestPoint.sortByX(coordListMap)

    expectedResult = [{1.2,3},{2.3,2.1},{3.1,1}]
    assert result == expectedResult
  end

  test "when given an even list of coordinates, return center coordinate index" do
    coordList = [{3.1,1}, {1.2,3}, {2.3,2.1}, {4,1}, {-1,3}]

    result = ClosestPoint.getMiddleCoord(coordList)

    expectedResult = 3
    assert result == expectedResult
  end
end
