module Helpers (strToInt,taker,count) where
strToInt x = read x :: Int
taker [] items = filter (/= -1) items
taker (x:xs) items = taker xs $ take x items ++ [-1] ++ drop (x+1) items
count arr match = length $ filter (==match) arr