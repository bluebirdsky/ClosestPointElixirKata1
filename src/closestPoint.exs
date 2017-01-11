defmodule Coord do
  defstruct x: 0, y: 0
end

defmodule ClosestPoint do

  @spec distanceBetweenTwoPoints(Coord, Coord) :: number
  def distanceBetweenTwoPoints(coord1, coord2) do
    :math.sqrt(:math.pow((coord1.x - coord2.x), 2) +
      :math.pow((coord1.y - coord2.y), 2))
  end

  def findPointDistances(coord0, coordList) do
    Enum.map(coordList, fn(a) -> %{dist: ClosestPoint.distanceBetweenTwoPoints(a, coord0), coord: a, coord0: coord0} end)
  end

  def sortByDistance(coordDistanceList) do
    Enum.sort(coordDistanceList, &(&1.dist < &2.dist))
  end

  def upper_triangle(coordList) do
    trimmedCoordList = Enum.drop(coordList, 1)

    if !Enum.empty?(trimmedCoordList) do
      coord0 = Enum.at(coordList, 0)
      coordDistanceList = upper_triangle(trimmedCoordList)
      Enum.concat(coordDistanceList, ClosestPoint.findPointDistances(coord0, trimmedCoordList) )
    else
      []
    end
  end

  def compute(coordList) do
    coordDistanceList = upper_triangle(coordList)
    distSorted = sortByDistance(coordDistanceList)
    Enum.at(distSorted, 0)
  end

end
