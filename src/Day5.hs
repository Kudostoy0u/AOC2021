module Main where
import Data.List.Split (splitOn)
import qualified Data.Map as Map
import Helpers (strToInt)
p2 = False
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
    xlist = if x2>x1 then [x1..x2] else [x1,x1-1..x2]
    ylist = if y2>y1 then [y1..y2] else [y1,y1-1..y2]
makeMap rest theMap = length $ filter (>1) $ Map.elems $ foldl (\theMap cord -> Map.insertWith (+) cord 1 theMap) theMap rest
main = readFile "input/Day5.txt" >>= \x -> print $ makeMap (filter (/=(-1,-1)) . concatMap (allPoints . map (map strToInt . splitOn ",") . splitOn " -> ") $ lines x) Map.empty