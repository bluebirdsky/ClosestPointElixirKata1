ExUnit.start
defmodule DivideAndConquerTest do
  use ExUnit.Case, async: true

  test "when given list of x, y coordinates, return list sorted by x" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1}]

    result = DivideAndConquer.sortByX(coordList)

    expectedResult = [%Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1}, %Coord{x: 3.1, y: 1}]
    assert result == expectedResult
  end

  test "when given an odd list of coordinates, return center coordinate index" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: -1, y: 3}]

    result = DivideAndConquer.getMiddleCoord(coordList)

    expectedResult = 3
    assert result == expectedResult
  end

  test "when given an even list of coordinates, return center coordinate index" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: -1, y: 3}, %Coord{x: -1, y: 10}]

    result = DivideAndConquer.getMiddleCoord(coordList)

    expectedResult = 4
    assert result == expectedResult
  end

  test "when given a list of coordinates, return two split domains of equal size" do
    coordList = [%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}]

    result = DivideAndConquer.splitCoordDomains(coordList, 3)

    expectedResult = [[%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1}],
      [%Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}]]
    assert result == expectedResult
  end

  test "when given a list of coordinates, return two split domains of unequal size" do
    coordList = [%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}]

    result = DivideAndConquer.splitCoordDomains(coordList, 3)

    expectedResult = [[%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1}],
      [%Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}]]
    assert result == expectedResult
  end

  test "when given a list of coordinates from two subdomains, return closest point from the two split domains" do
    coordSplitList = [[%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1}],
      [%Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}]]

    result = DivideAndConquer.closestPointsInTwoDomains(coordSplitList)

    assert result.dist == 1.0 &&
      ((result.coord0 == %Coord{x: 5, y: 3} && result.coord == %Coord{x: 6, y: 3}) ||
       (result.coord == %Coord{x: 5, y: 3} && result.coord0 == %Coord{x: 6, y: 3}) )
  end

  test "when given a sorted list of coordinates, return middle slice of width 2d" do
    sortedCoordList = [%Coord{x: 0, y: 0}, %Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}, %Coord{x: 7, y: 2}, %Coord{x: 8, y: 2}]
    dist = 2.0

    result = DivideAndConquer.middleDomain(sortedCoordList, dist)

    expectedResult = [%Coord{x: 3, y: 2.1}, %Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}, %Coord{x: 7, y: 2}]

    assert result == expectedResult
  end

end
