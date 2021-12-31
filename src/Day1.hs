module Day1 (day1) where
solveDay1 p2 x y z = if x < length z then solveDay1 p2 (x+1) (y ++ [(if p2 then z!!x + z!!(x-1) + z!!(x-2) else z!!x) - (if p2 then z!!(x-1) + z!!(x-2) + z!!(x-3) else z !! (x-1))]) z else length $ filter (> 0) y
day1 p2 = solveDay1 p2 (if p2 then 4 else 1) [] . map (\x-> read x :: Int) . lines