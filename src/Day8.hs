module Day8 (day8) where
import Helpers (splitOn)
day8 p2 x = let input = concatMap(map words.splitOn"|").lines in input