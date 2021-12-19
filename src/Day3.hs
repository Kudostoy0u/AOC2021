module Main where
import Data.List.Split (splitOn)
import Data.List (transpose)
import Data.Char (digitToInt)
main :: IO ()
part2 = True
convert :: [Int] -> Int
convert [] = 0
convert (x : xs) = x + 2 * convert xs
solvePart1 :: [Int] -> Int
solvePart1 x = convert x * convert (map (\ y -> if y == 1 then 0 else 1) x)
filterOut :: [String] -> Int -> Bool -> Int
filterOut arr idx isOxy = if length arr >= 1 then convert (map digitToInt (head arr))  else filterOut (filter (\x -> digitToInt (x!!1) == (toBinary arr !! idx ) ) arr) (idx+1) isOxy
solvePart2 :: [String] -> Int
solvePart2 x = let preset = filterOut x 0 in preset True * preset False
toBinary :: [String] -> [Int]
toBinary = map ( (\y->if y>500 then 1 else 0) . sum . map digitToInt) . transpose
main = readFile "input/Day3.txt" >>= print . (\x -> if part2 then solvePart2 (lines x)  else solvePart1 $ reverse $ toBinary $ lines x)