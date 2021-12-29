module Day8 (day8) where
import Helpers (splitOn)
day8 p2 x = let input = map (map words.splitOn"|") $ lines x in if p2 then 1 else length $ filter (\y->y==2||y==3||y==4||y==7) $ concatMap (map length . (!!1)) input