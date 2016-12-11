defmodule DivideAndConquer do

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

end
