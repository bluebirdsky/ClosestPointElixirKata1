defmodule Coord do
  defstruct x: 0, y: 0
end

defmodule ClosestPoint do

  def sortByX(coordList) do
    Enum.sort(coordList, &(&1.x < &2.x))
  end

  def getMiddleCoord(coordList) do

    listLength = length coordList

    if rem(listLength, 2) == 0 do
      round(listLength/2 + 1)
    else
      round(listLength/2)
    end

  end

  def splitCoordDomains(coordList, groupSize) do
    coordList |> Enum.chunk(groupSize)
  end

  @spec distanceBetweenTwoPoints(Coord, Coord) :: number
  def distanceBetweenTwoPoints(coord1, coord2) do
    :math.sqrt(:math.pow((coord1.x - coord2.x), 2) +
      :math.pow((coord1.y - coord2.y), 2))
  end

  def findPointDistances(coord, coordList) do
    Enum.map(coordList, fn(a) -> %{dist: ClosestPoint.distanceBetweenTwoPoints(a, coord), coord: a} end)
  end

  def findClosestPoint(coord, coordList) do
    dist = ClosestPoint.findPointDistances(coord, coordList)
    distSorted = Enum.sort(dist, &(&1.dist < &2.dist))
    Enum.at(distSorted, 1)
  end

  def findTwoClosestPoints(coordList) do
    dist = Enum.map(coordList, fn(a) -> Map.merge(ClosestPoint.findClosestPoint(a, coordList), %{coord0: a}) end)
    distSorted = Enum.sort(dist, &(&1.dist < &2.dist))
    Enum.at(distSorted, 0)
  end

end
