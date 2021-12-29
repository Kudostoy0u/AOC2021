module Helpers (strToInt,taker,count,splitOn,chunksOf,group,transpose,sort,digitToInt,elemIndex,foldl') where
import Data.List.Split (splitOn,chunksOf)
import Data.List (group,transpose,sort,elemIndex)
import Data.Char (digitToInt)
strToInt x = read x :: Int
taker [] items = filter (/= -1) items
taker (x:xs) items = taker xs $ take x items ++ [-1] ++ drop (x+1) items
count arr match = length $ filter (==match) arr
foldl' f z [] = z
foldl' f z (x:xs) = let z' = z `f` x in seq z' $ foldl' f z' xs