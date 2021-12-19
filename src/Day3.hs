module Main where
import Data.List.Split (splitOn)
import Data.List (transpose)
import Data.Char (digitToInt)
main :: IO ()
part2 = True
convert [] = 0
convert (x : xs) = x + 2 * convert xs
gammaToEpsilon :: [Integer] -> [Integer]
gammaToEpsilon = map (\ x -> if x == 1 then 0 else 1)
-- BINARY MUST BE REVERSED FOR PART 1 WHERE THE FIRST DIGIT IS THE LEAST SIGNIFICANT
multiplyTwoBinaries x = convert x * convert (gammaToEpsilon x)

solvePart2 x = 3
toBinary = map ( (\y->if y>500 then 1 else 0) . sum . map digitToInt) . transpose
main = readFile "input/Day3.txt" >>= print . let vals = lines in (\x -> if part2 then solvePart2 vals else multiplyTwoBinaries $ reverse $ toBinary $ lines x)