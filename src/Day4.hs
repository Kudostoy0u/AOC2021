-- Plan is to replace the taken bingo slots with 0s, add everything on the bingo card together since 0s don't add anything anyways and if a row/column sums to 0 then that bingo card won
module Main where 
import Data.List.Split (splitOn)
-- Significantly more organized code because it's more complex lol
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (\x -> x /= "") $ lines input
    let bingoInstructions = map (\x -> read x :: Int) $ splitOn "," $ allInput !! 0 
    let bingoLines = tail allInput
    print $ map words bingoLines