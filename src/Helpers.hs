module Helpers (strToInt) where
strToInt :: [String] -> [Int]
strToInt x = map (\y -> read y :: Int) x