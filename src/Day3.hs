module Main where
import Data.List.Split (splitOn)
import Data.List (transpose, group)
import Data.Char (digitToInt)
main :: IO ()
part2 = True -- toggle whether part 1 or part 2
count x = length . filter (x==)
mostCommon oxy x = let ones = count 1 x; zeros = count 0 x; one = if oxy then 1 else 0; zero = if oxy then 0 else 1 in if ones > zeros || ones == zeros then one else zero
convert [] = 0
convert (x : xs) = x + 2 * convert xs
solvePart1 x = convert x * convert (map (\y -> if y == 1 then 0 else 1) x)
filterOut arr idx isOxy = if length arr == 1 then convert $ reverse $ map digitToInt (head arr) else filterOut (filter (\x -> digitToInt (x!!idx) == (toBinary isOxy arr !! idx)) arr) (idx+1) isOxy
solvePart2 x = let preset = filterOut x 0 in preset True * preset False
toBinary oxy = map (mostCommon oxy . map digitToInt) . transpose
main = readFile "input/Day3.txt" >>= print . \x -> if part2 then solvePart2 (lines x) else solvePart1 $ reverse $ toBinary False $ lines x
