--module Main where
-- uncomment above if is specified to run on AOC2021.cabal
import Helpers (strToInt)
p2 = True -- toggle whether part 1 or part 2
solveDay2 idx x y aim list
    | cmd == "forward" = solveDay2 (idx+1) (x+cord) (if p2 then y + aim*cord else y) aim list
    | cmd == "down" = solveDay2 (idx+1) x (if p2 then y else y+cord) (if p2 then aim+cord else aim) list
    | cmd == "up" = solveDay2 (idx+1) x (if p2 then y else y-cord) (if p2 then aim-cord else aim) list
    | otherwise = x*y
    where cmd = if idx < length list then head (list !! idx) else "0"
          cord = if idx < length list then strToInt (list !! idx !! 1) else 0
main = readFile "input/Day2.txt" >>= print . solveDay2 0 0 0 0 . map words . lines
