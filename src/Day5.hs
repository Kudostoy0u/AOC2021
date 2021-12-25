{-
NOT USING MATRIX
Using point data create array of all points, then count the number of duplicates
-}
module Main where
import Data.List.Split (splitOn,chunksOf)
import Helpers (strToInt)
allPoints :: [[Int]] -> [Int]
allPoints x = x!!0
main = do
    input <- readFile "input/Day5.txt"
    let cords = map (allPoints . map (map strToInt . splitOn ",") . splitOn " -> ") $ lines input
    
    --let board = zero 1001 1001
    print cords