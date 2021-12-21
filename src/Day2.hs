p2 = True -- toggle whether part 1 or part 2
day2 idx x y aim list
    | cmd == "forward" = day2 (idx+1) (x+cord) (if p2 then y + aim*cord else y) aim list
    | cmd == "down" = day2 (idx+1) x (if p2 then y else y+cord) (if p2 then aim+cord else aim) list
    | cmd == "up" = day2 (idx+1) x (if p2 then y else y-cord) (if p2 then aim-cord else aim) list
    | otherwise = x*y
    where cmd = if idx < length list then head (list !! idx) else "0"
          cord = if idx < length list then read (list !! idx !! 1) :: Int else 0
main = readFile "input/Day2.txt" >>= print . day2 0 0 0 0 . map words . lines
