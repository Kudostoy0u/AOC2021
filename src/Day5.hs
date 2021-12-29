module Day5 (day5) where
import qualified Data.IntMap as Map
import Helpers (strToInt,splitOn)
allPoints p2 x
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
solveDay5 rest theMap = length $ filter (>1) $ Map.elems $ foldr (\cord theMap -> Map.insertWith (+) cord 1 theMap) theMap rest
day5 p2 x = solveDay5 (map (\y->(snd y * 1000)+fst y). filter (/=(-1,-1)) . concatMap (allPoints p2 . map (map strToInt . splitOn ",") . splitOn " -> ") $ lines x) Map.empty