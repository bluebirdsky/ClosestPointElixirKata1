ExUnit.start
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "when given list of x, y coordinates, return list sorted by x" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1}]

    result = ClosestPoint.sortByX(coordList)

    expectedResult = [%Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1}, %Coord{x: 3.1, y: 1}]
    assert result == expectedResult
  end

  test "when given an odd list of coordinates, return center coordinate index" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: -1, y: 3}]

    result = ClosestPoint.getMiddleCoord(coordList)

    expectedResult = 3
    assert result == expectedResult
  end

  test "when given an even list of coordinates, return center coordinate index" do
    coordList = [%Coord{x: 3.1, y: 1}, %Coord{x: 1.2, y: 3}, %Coord{x: 2.3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: -1, y: 3}, %Coord{x: -1, y: 10}]

    result = ClosestPoint.getMiddleCoord(coordList)

    expectedResult = 4
    assert result == expectedResult
  end

  test "when given a list of coordinates, return two split domains" do
    coordList = [%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1},
      %Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}]

    result = ClosestPoint.splitCoordDomains(coordList, 3)

    expectedResult = [[%Coord{x: 1, y: 1}, %Coord{x: 2, y: 3}, %Coord{x: 3, y: 2.1}],
      [%Coord{x: 4, y: 1}, %Coord{x: 5, y: 3}, %Coord{x: 6, y: 3}]]
    assert result == expectedResult
  end

  test "creates define coordinate at origin" do
    result = %Coord{}
    assert result.x == 0 && result.y == 0
  end

  test "creates define coordinate at specified point" do
    result = %Coord{x: 21.2, y: 211.1}
    assert result.x == 21.2 && result.y == 211.1
  end

  test "compute the distance between two points" do
    coord1 = %Coord{}
    coord2 = %Coord{x: 1}
    result = ClosestPoint.distanceBetweenTwoPoints(coord1, coord2)
    assert result == 1
  end

  test "compute the distance between two points auxiliary test" do
    coord1 = %Coord{x: 50, y: 10}
    coord2 = %Coord{x: 10, y: 30}
    result = ClosestPoint.distanceBetweenTwoPoints(coord1, coord2)
    assert Float.round(result,5) == 44.72136
  end

  test "compute the distance between one point given a list of points" do
    coord = %Coord{x: 20.3, y: 12}
    coordList = [%Coord{x: 10, y: 40}, %Coord{x: 20, y: 30}]

    result = ClosestPoint.findPointDistances(coord, coordList)

    assert result ==
      [%{coord: %Coord{x: 10, y: 40}, dist: 29.834376145647827},
      %{coord: %Coord{x: 20, y: 30}, dist: 18.002499826412997}]
  end

  test "compute the point in a list closest to a given point" do
    coord = %Coord{x: 20.3, y: 12}
    coordList = [%Coord{x: 10, y: 40}, coord, %Coord{x: 20, y: 30}, %Coord{x: 5, y: 2.1}]

    result = ClosestPoint.findClosestPoint(coord, coordList)

    assert result == %{coord: %Coord{x: 20, y: 30}, dist: 18.002499826412997}
  end

  test "compute the two closest point brutt force" do
    coordList = [%Coord{x: 10, y: 41}, %Coord{x: 20.3, y: 12}, %Coord{x: 20, y: 31.5}, %Coord{x: 5, y: 2.1}]

    result = ClosestPoint.findTwoClosestPoints_BrutForce(coordList)

    assert result.dist == 13.793114224133722 &&
      ((result.coord0 == %Coord{x: 20, y: 31.5} && result.coord == %Coord{x: 10, y: 41}) ||
       (result.coord == %Coord{x: 20, y: 31.5} && result.coord0 == %Coord{x: 10, y: 41}) )
  end

end
