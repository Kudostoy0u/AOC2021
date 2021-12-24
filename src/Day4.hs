{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
import Debug.Trace (traceShow)
import Data.Matrix
import Data.List.Split (splitOn, chunksOf)
import Helpers ( strToInt )
--Significantly more organized code because it's more complex lol
getNewCheckBoard :: Int -> [(Int,Matrix Int)] -> [(Int,Matrix Int)] -> Int -> Matrix Int
getNewCheckBoard instruction bingoBoards checkBoards board = let bingoBoard = (bingoBoards!!board);checkBoard = checkBoards!!board in mapPos (\(row, column) a -> if (snd bingoBoard!(row,column))==instruction then 1 else snd checkBoard!(row,column)) (snd checkBoard)
getIfSolved :: [(Int,Matrix Int)] -> Int
getIfSolved x = map (\x -> ) x
part1 :: [(Int,Matrix Int)] -> [(Int,Matrix Int)] -> [Int] -> Int
part1 checkBoard bingoBoard (instruction:rest) = let newChecker = [getNewCheckBoard instruction bingoBoard checkBoard i | i <- [0..length bingoBoard-1]]; isSolved = getIfSolved newChecker in if isSolved > -1 then {-placeholder for solution function-}1 else 1
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (/= "") $ lines input
    let bingoInstructions = map strToInt (splitOn "," $ head allInput)
    let bingoLines = tail allInput
    let checkBoards = zip [0..] (replicate (length bingoLines `div` 5) $ zero 5 5) :: [(Int,Matrix Int)]
    let bingoBoards = zip [0..] (map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") bingoLines) :: [(Int,Matrix Int)]
    print $ part1 checkBoards bingoBoards bingoInstructions