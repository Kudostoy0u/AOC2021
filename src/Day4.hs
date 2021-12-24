-- As problems get more complicated type annotations and syntax sugar become more essential
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
--import Debug.Trace (traceShow)
import Data.Matrix((!), fromLists, getCol, getRow, mapPos, toList, Matrix)
import Data.List.Split (splitOn, chunksOf)
import Data.List (elemIndex)
import Helpers (strToInt)
p2 = True -- Toggle whether part 1 or 2
getTotal :: Matrix Int -> Int
getTotal x = sum $ filter (>=0) $ toList x
getIfSolved :: [Matrix Int] -> Maybe Int
getIfSolved a = elemIndex True $ map (\z -> elem (negate 5) $ map (\y -> sum $ getRow y z) [1..5] ++ map (\y -> sum $ getCol y z) [1..5]) a
part1 :: [Matrix Int] -> [Int] -> Int
part1 bingoBoard (instruction:rest) = let newBoard = map (\x -> mapPos (\(row,column) a -> if x!(row,column) == instruction then -1 else a) x) bingoBoard; isSolved = getIfSolved newBoard in case isSolved of Just n -> instruction * getTotal (newBoard!!n); Nothing -> part1 newBoard rest
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (/= "") $ lines input
    let bingoInstructions = map strToInt (splitOn "," $ head allInput)
    let bingoLines = tail allInput
    let bingoBoards = map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") bingoLines
    print $ part1 bingoBoards bingoInstructions