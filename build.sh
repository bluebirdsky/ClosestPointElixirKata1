#!/bin/bash
rm ./*.beam
elixirc ./src/closestPoint.exs
elixir ./test/closestPointTest.exs

elixirc ./src/divideAndConquer.exs
elixir ./test/divideAndConquerTest.exs
