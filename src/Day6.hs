module Main where
import Data.List.Split (splitOn)
import Helpers (strToInt)
solveDay6 :: Int -> Int -> [Int] -> Int
solveDay6 idx max fishes = if idx > max  then length fishes else solveDay6 (idx+1) max $ concatMap (\x->if x > 0 then [x-1] else [6,8]) fishes

-- Subtract 1 from the day
main = readFile "input/Day6.txt" >>= \x -> print $ solveDay6 0 255 (map strToInt $ splitOn "," x)