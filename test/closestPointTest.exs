ExUnit.start
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "when given list of x, y coordinates, return list sorted by x" do
    coordListMap = MapSet.new([{3.1,1}, {1.2,3}, {2.3,2.1}])

    result = ClosestPoint.sortByX(coordListMap)

    expectedResult = [{1.2,3},{2.3,2.1},{3.1,1}]
    assert result == expectedResult
  end

  test "when given an odd list of coordinates, return center coordinate index" do
    coordList = [{3.1,1}, {1.2,3}, {2.3,2.1}, {4,1}, {-1,3}]

    result = ClosestPoint.getMiddleCoord(coordList)

    expectedResult = 3
    assert result == expectedResult
  end

  test "when given an even list of coordinates, return center coordinate index" do
    coordList = [{3.1,1}, {1.2,3}, {2.3,2.1}, {4,1}, {-1,3}, {-1,3}]

    result = ClosestPoint.getMiddleCoord(coordList)

    expectedResult = 4
    assert result == expectedResult
  end

  test "when given a list of coordinates, return two slit domains" do
    coordList = [{1,1}, {2,3}, {3,2.1}, {4,1}, {5,3}, {6,3}]

    result = ClosestPoint.splitCoordDomains(coordList, 3)

    expectedResult = [[{1,1}, {2,3}, {3,2.1}], [{4,1}, {5,3}, {6,3}]]
    assert result == expectedResult
  end

end
