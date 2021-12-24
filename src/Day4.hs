{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
import Debug.Trace (traceShow)
import Data.Matrix
import Data.List.Split (splitOn, chunksOf)
import Data.List (elemIndex)
import Helpers ( strToInt )
getTotal x = sum $ filter (>=0) $ toList x
getIfSolved :: [Matrix Int] -> Maybe Int
getIfSolved a = elemIndex True $ map (\z -> elem (negate 5) $ map (\y -> sum $ getRow y z) [1..5] ++ map (\y -> sum $ getCol y z) [1..5]) a
part1 :: [Matrix Int] -> [Int] -> Maybe Int
part1 bingoBoard (instruction:rest) = let newBoard = map (\x -> mapPos (\(row,column) a -> if x!(row,column) == instruction then -1 else a) x) bingoBoard; isSolved = getIfSolved newBoard in isSolved
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (/= "") $ lines input
    let bingoInstructions = map strToInt (splitOn "," $ head allInput)
    let bingoLines = tail allInput
    --let checkBoards = zip [0..] (replicate (length bingoLines `div` 5) $ zero 5 5) :: [(Int,Matrix Int)]
    let bingoBoards = map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") bingoLines
    let sample = [fromLists [[-1,-1,-1,-1,3],[-1,4,0,0,0],[-1,0,0,0,0],[-1,0,0,0,0],[-1,0,0,0,0]]]
    print $ part1 bingoBoards bingoInstructions