#!/bin/bash
rm Elixir.ClosestPoint.beam
elixirc ./src/closestPoint.exs
elixir ./test/closestPointTest.exs
