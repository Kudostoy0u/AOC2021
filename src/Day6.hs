{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Day6 (day6) where
import Data.List.Split (splitOn)
import Helpers (strToInt,count)
update [a,b,c,d,e,f,g,h,i] = [b,c,d,e,f,g,h+a,i,a]
solveDay6 day x = sum $ iterate update x !! day
day6 p2 x = let fishes = (map strToInt $ splitOn "," x) in solveDay6 (if p2 then 256 else 80) $ map (count fishes) $ take 9 [0,1..]