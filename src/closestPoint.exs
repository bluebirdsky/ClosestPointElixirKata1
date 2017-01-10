defmodule Coord do
  defstruct x: 0, y: 0
end

defmodule ClosestPoint do

  @spec distanceBetweenTwoPoints(Coord, Coord) :: number
  def distanceBetweenTwoPoints(coord1, coord2) do
    :math.sqrt(:math.pow((coord1.x - coord2.x), 2) +
      :math.pow((coord1.y - coord2.y), 2))
  end

  def findPointDistances(coord, coordList) do
    Enum.map(coordList, fn(a) -> %{dist: ClosestPoint.distanceBetweenTwoPoints(a, coord), coord: a} end)
  end

  def sortByDistance(coordDistanceList) do
    Enum.sort(coordDistanceList, &(&1.dist < &2.dist))
  end

  def findClosestPoint(coord, coordList) do
    coordDistanceList = ClosestPoint.findPointDistances(coord, coordList)
    distSorted = sortByDistance(coordDistanceList)
    Enum.at(distSorted, 1)
  end

  def compute(coordList) do
    coordDistanceList = Enum.map(coordList, fn(a) -> Map.merge(ClosestPoint.findClosestPoint(a, coordList), %{coord0: a}) end)
    distSorted = sortByDistance(coordDistanceList)
    Enum.at(distSorted, 0)
  end

end
