module Main where
import Data.Matrix((!), fromLists, getCol, getRow, mapPos, toList, Matrix,zero)
import Data.List.Split (splitOn, chunksOf)
import Data.List (elemIndex)
import Helpers (strToInt)
p2 = True -- Toggle whether part 1 or 2
taker [] items = filter (/= -1) items
taker (x:xs) items = taker xs $ take x items ++ [-1] ++ drop (x+1) items
getTotal x = sum $ filter (>=0) $ toList x
getIfSolved a = map fst $ filter snd (zip [0..] (map (\z -> elem (negate 5) $ map (\y -> sum $ getRow y z) [1..5] ++ map (\y -> sum $ getCol y z) [1..5]) a) :: [(Int,Bool)])
part1 bingoBoard (instruction:rest) = let newBoard = map (\x -> mapPos (\(row,column) a -> if x!(row,column) == instruction then -1 else a) x) bingoBoard; isSolved = getIfSolved newBoard in if not(null isSolved) then if p2&&(length bingoBoard > 1) then part1 (taker isSolved newBoard) rest else instruction * getTotal (newBoard!!head isSolved) else part1 newBoard rest
main = do
    input <- readFile "input/Day4.txt"
    let allInput = filter (/= "") $ lines input
    let bingoInstructions = map strToInt (splitOn "," $ head allInput)
    let bingoBoards = map fromLists $ chunksOf 5 $ map (map strToInt . filter (not . null) . splitOn " ") $ tail allInput
    print $ part1 bingoBoards bingoInstructions