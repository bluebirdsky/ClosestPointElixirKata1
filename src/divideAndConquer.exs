defmodule DivideAndConquer do

  def sortByX(coordList) do
    Enum.sort(coordList, &(&1.x < &2.x))
  end

  def getMiddleCoord(sortedCoordList) do

    listLength = length sortedCoordList

    if rem(listLength, 2) == 0 do
      round(listLength/2 + 1)
    else
      round(listLength/2)
    end

  end

  def splitCoordDomains(sortedCoordList, groupSize) do
    sortedCoordList |> Enum.chunk(groupSize, groupSize, [])
  end

  def determineClosestPoints(closestPointsList) do
    sortedByDistList = ClosestPoint.sortByDistance(closestPointsList)
    Enum.at(sortedByDistList, 0)
  end

  def closestPointsInTwoDomains(coordSplitList) do
    closestPointsList = Enum.map(coordSplitList, fn(a) -> ClosestPoint.compute(a) end)
    determineClosestPoints(closestPointsList)
  end

  def getMiddleCoordDomain(sortedCoordList, dist) do
    middleCoordIndex = DivideAndConquer.getMiddleCoord(sortedCoordList)
    middleCoord = Enum.at(sortedCoordList, middleCoordIndex)
    minMiddleDomain = middleCoord.x - dist
    maxMiddleDomain = middleCoord.x + dist
    Enum.filter(sortedCoordList, fn(a) -> (a.x >= minMiddleDomain && a.x <= maxMiddleDomain) end )
  end

  def implementAlgorithm(coordList) do
    if !Enum.empty?(Enum.drop(coordList, 4)) do
      sortedCoordList = DivideAndConquer.sortByX(coordList)
      middleCoordIndex = DivideAndConquer.getMiddleCoord(sortedCoordList)
      coordSplitDomainList = DivideAndConquer.splitCoordDomains(sortedCoordList, middleCoordIndex)
      closestPointsInHalfDomain = DivideAndConquer.closestPointsInTwoDomains(coordSplitDomainList)
      middleDomainCoordList = DivideAndConquer.getMiddleCoordDomain(sortedCoordList, closestPointsInHalfDomain.dist)
      closestPointsInMiddleDomain = ClosestPoint.compute(middleDomainCoordList)
      DivideAndConquer.determineClosestPoints([closestPointsInHalfDomain, closestPointsInMiddleDomain])
    else
      ClosestPoint.compute(coordList)
    end
  end

  def isValidInput(coordList) do
    is_list(coordList)
  end

  def compute(coordList) do
    if isValidInput(coordList) do
      implementAlgorithm(coordList)
    else
      nil
    end
  end

end
