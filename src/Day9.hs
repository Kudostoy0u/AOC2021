module Day9 (day9) where
import Helpers (digitToInt,fromMaybe)
import Control.Arrow as Bi
import qualified Data.Map as Map
allBigger val = all (val <)
getAllSurrounding grid key = map (fromMaybe 10) [Map.lookup (fst key - 1,snd key) grid, Map.lookup (fst key + 1, snd key) grid, Map.lookup (fst key, snd key + 1) grid, Map.lookup (fst key, snd key - 1) grid]
btmPoints grid = sum $ map (\x->1+snd x) $ Map.toList $ Map.filterWithKey (\key value -> allBigger value (getAllSurrounding grid key)) grid
day9 p2 input = let parsedInput = Map.fromList $ concatMap ((\line -> map (\x->((fst x,fst line),digitToInt $ snd x)) $ snd line) . Bi.second (zip [0..])) $ zip [0..] $ lines input in btmPoints parsedInput
--filterWithKey