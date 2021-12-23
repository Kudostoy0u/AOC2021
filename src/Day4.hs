{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
--import Debug.Trace (traceShow)
import Data.Matrix 
import Data.List.Split (splitOn, chunksOf)
import Helpers ( strToInt )
--Significantly more organized code because it's more complex lol
--getNewCheckBoard instruction bingoBoard checkBoard = mapPos (\(r,c) a->if (bingoBoard!(r,c))==instruction then 1 else 0) checkBoard
part1 checkBoard bingoBoard (instruction:rest) = getNewCheckBoard instruction bingoBoard checkBoard
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (/= "") $ lines input
    let bingoInstructions = map strToInt (splitOn "," $ head allInput)
    let bingoLines = tail allInput
    let checkBoards = replicate (length bingoLines `div` 5) $ zero 5 5
    let bingoBoards = zip [0..] (map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") bingoLines) :: (Integer,Matrix Int)
    print $ bingoBoards--part1 (checkBoards!!0) (bingoBoards!!0) bingoInstructions