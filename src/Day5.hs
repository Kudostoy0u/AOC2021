{-
NOT USING MATRIX
Using point data create array of all points, then count the number of duplicates
-}
module Main where
import Data.List.Split (splitOn,chunksOf)
import Data.List (group)
import qualified Data.Map as Map
import Helpers (strToInt,count)
p2 = False
allPoints :: [[Int]] -> [(Int,Int)]
allPoints x
  | x1 == x2 = {-vertical-} zip (repeat x1) ylist
  | y1 == y2 = {-horizontal-} zip xlist (repeat y1)
  | otherwise = {-diagonal-} if p2 then zip xlist ylist else [(-1,-1)]
  where
    first = head x
    second = x!!1
    x1 = head first
    x2 = head second
    y1 = first!!1
    y2 = second!!1
    xlist = if x2 > x1 then [x1..x2] else [x2..x1]
    ylist = if y2 > y1 then [y1..y2] else [y2..y1]
makeMap :: [(Int,Int)] -> Map.Map (Int,Int) Int -> Map.Map (Int,Int) Int
makeMap [] theMap = theMap
makeMap (cord:rest) theMap = makeMap rest $ Map.insertWith (+) cord 1 theMap
main = do
    input <- readFile "input/Day5.txt"
    let cords = filter (/=(-1,-1)) . concatMap (allPoints . map (map strToInt . splitOn ",") . splitOn " -> ") $ lines input
    --let res = length $ filter (\x -> count x cords > 1) cords
    --print $ res `div` 2
    print $ makeMap cords (Map.empty)