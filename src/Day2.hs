module Day2 (day2) where
import Helpers (strToInt)
solveDay2 p2 idx x y aim list
    | cmd == "forward" = solveDay2 p2 (idx+1) (x+cord) (if p2 then y + aim*cord else y) aim list
    | cmd == "down" = solveDay2 p2 (idx+1) x (if p2 then y else y+cord) (if p2 then aim+cord else aim) list
    | cmd == "up" = solveDay2 p2 (idx+1) x (if p2 then y else y-cord) (if p2 then aim-cord else aim) list
    | otherwise = x*y
    where cmd = if idx < length list then head (list !! idx) else "0"
          cord = if idx < length list then strToInt (list !! idx !! 1) else 0
day2 p2 = solveDay2 p2 0 0 0 0 . map words . lines
