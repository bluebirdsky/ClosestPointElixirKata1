defmodule Coord do
  defstruct x: 0, y: 0
end

defmodule ClosestPoint do

  def sortByX(coordListMap) do
    Enum.sort(coordListMap)
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
end
