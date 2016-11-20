defmodule ClosestPoint do

  def sortByX(coordListMap) do
    Enum.sort(coordListMap)
  end

  def getMiddleCoord(coordList) do
    round((length coordList)/2)
  end

end
