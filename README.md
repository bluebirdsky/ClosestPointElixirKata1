# Closest Point Calculator Kata in Elixir

This kata is based on the Divide and Conquer exercise at http://www.geeksforgeeks.org/closest-pair-of-points/

## Problem

Given an array of n points in the plane, find the closest pair of points in the array.  

## Implementation

Two solution approaches are implemented that are based on the following structure definition for coordinates:

	  defstruct x:, y:

The return value is a structure the two closest points and their distance:

	  defstruct coord0:, coord:, dist:

### ClosestPoint:
Implements a brute force solution approach by exploring the upper search triangle.

	  ClosestPoint.compute(coordList)

### DivideAndConquer:
Implements the algorithm described in the link above.

	  DivideAndConquer.compute(coordList)

## Requirements to Run
- Elixir
- Git
- Linux (for shell script)

## Installing Elixir
- http://elixir-lang.org/install.html

## Steps to Run
To build the application and perform unit tests use command:

		$ ./build.sh

## Interactive Shell
To run Elixir interactively use the following command:

		$ iex
