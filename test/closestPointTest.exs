ExUnit.start
defmodule ClosestPointTest do
  use ExUnit.Case, async: true

  test "creates coordinate at origin" do
    result = %Coord{}
    assert result.x == 0 && result.y == 0
  end

  test "creates coordinate at specified point" do
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

  test "compute the two closest points using brut force" do
    coordList = [%Coord{x: 10, y: 41}, %Coord{x: 20.3, y: 12}, %Coord{x: 20, y: 31.5}, %Coord{x: 5, y: 2.1}]

    result = ClosestPoint.compute(coordList)

    assert result.dist == 13.793114224133722 &&
      ((result.coord0 == %Coord{x: 20, y: 31.5} && result.coord == %Coord{x: 10, y: 41}) ||
       (result.coord == %Coord{x: 20, y: 31.5} && result.coord0 == %Coord{x: 10, y: 41}) )
  end

  test "return nil for blank coordList" do
    coordList = []

    result = ClosestPoint.compute(coordList)

    assert result == nil
  end

  test "return nil for input that is not a list" do
    result = ClosestPoint.compute(1)
    assert result == nil
  end

  test "return nil for input that is not a list of type map" do
    result = ClosestPoint.compute([1, 2])
    assert result == nil
  end

end
