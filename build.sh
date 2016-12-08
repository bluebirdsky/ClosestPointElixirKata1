#!/bin/bash
rm ./*.beam
elixirc ./src/closestPoint.exs
elixir ./test/closestPointTest.exs
