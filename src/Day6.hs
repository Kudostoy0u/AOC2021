{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Main where
import Data.List.Split (splitOn)
import Helpers (strToInt,count)
update [a,b,c,d,e,f,g,h,i] = [b,c,d,e,f,g,h+a,i,a]
solveDay6 day x = sum $ iterate update x !! day
main = readFile "input/Day6.txt" >>= \x -> print $ let fishes = (map strToInt $ splitOn "," x) in solveDay6 256 $ map (count fishes) $ take 9 [0,1..]