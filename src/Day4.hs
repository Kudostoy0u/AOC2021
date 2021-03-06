{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Day4 (day4) where
import Data.Matrix((!), fromLists, getCol, getRow, mapPos, toList)
import Helpers (strToInt,taker,splitOn,chunksOf,elemIndex)
getTotal x = sum $ filter (>=0) $ toList x
getIfSolved a = map fst $ filter snd (zip [0..] (map (\z -> elem (negate 5) $ map (\y -> sum $ getRow y z) [1..5] ++ map (\y -> sum $ getCol y z) [1..5]) a) :: [(Int,Bool)])
solveDay4 p2 bingoBoard (instruction:rest) = let newBoard = map (\x -> mapPos (\(row,column) a -> if x!(row,column) == instruction then -1 else a) x) bingoBoard; isSolved = getIfSolved newBoard in if not(null isSolved) then if p2&&length bingoBoard > 1 then solveDay4 p2 (taker isSolved newBoard) rest else instruction * getTotal (newBoard!!head isSolved) else solveDay4 p2 newBoard rest
day4 p2 x = let allInput = filter (/= "") $ lines x in solveDay4 p2 (map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") $ tail allInput) (map strToInt (splitOn "," $ head allInput))