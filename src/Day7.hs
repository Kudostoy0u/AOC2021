module Day7 (day7) where
import Helpers (strToInt,splitOn,sort)
solveDay7 p2 [] x y = x
solveDay7 p2 (x:xs) acc num = let difference = abs(x-num) in solveDay7 p2 xs (if p2 then acc + (difference^2+difference) `div` 2 else acc+difference) num
day7 p2 x = let list = sort $ map strToInt $ splitOn "," x;middle = length list `div` 2 in minimum [solveDay7 p2 list 0 x | x <- [minimum list..maximum list]]