module Day8 (day8) where
import Helpers (splitOn,sort)
inCommon list = length . filter (`elem` list)
getElem commonLen matchLen notEqTo compareElem = head . filter (\x -> inCommon compareElem x == commonLen && length x == matchLen && notElem x notEqTo)
matchWelsh welsh = let [n1,n7,n4,n8] = map (\x-> (\len -> head . filter (\z -> length z == len)) x welsh) [2,3,4,7]; [n9,n3,n0,n6,n5,n2] = [getElem 4 6 [] n4 welsh,getElem 3 5 [] n7 welsh,getElem 3 6 [n9] n7 welsh,getElem 6 6 [n0,n9] n8 welsh, getElem 5 5 [] n6 welsh,getElem 5 5 [n3,n5] n8 welsh] in zip [0,1..] $ map sort [n0,n1,n2,n3,n4,n5,n6,n7,n8,n9]
getNum allWelsh = sum $ map (\line -> let nums = (matchWelsh $ head line); output = map sort $ line!!1 in read $ concatMap (show . (\x -> fst $ head (filter (\y->snd y == x) nums))) output) allWelsh
day8 p2 input = let parsedInput = map (map words.splitOn"|") $ lines input in if p2 then getNum parsedInput else length . filter (`elem` [2,3,4,7]) $ concatMap (map length . (!!1)) parsedInput