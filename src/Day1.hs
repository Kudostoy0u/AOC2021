--module Main where
-- uncomment above if is specified to run on AOC2021.cabal
p2 = True -- Toggle whether you're trying to solve part 1 or 2
solveDay1 x y z = if x < length z then solveDay1 (x+1) (y ++ [(if p2 then z!!x + z!!(x-1) + z!!(x-2) else z!!x) - (if p2 then z!!(x-1) + z!!(x-2) + z!!(x-3) else z !! (x-1))]) z else length $ filter (> 0) y
main = readFile "input/Day1.txt" >>= print . solveDay1 (if p2 then 4 else 1) [] . map (\x-> read x :: Int) . lines