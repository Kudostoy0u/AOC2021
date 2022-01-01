module Day9 (day9) where
import Helpers (digitToInt)
import Control.Arrow as Bi
import qualified Data.Map as Map
day9 p2 input = Map.lookup (1,1) $ Map.fromList $ concatMap ((\line -> map (\x->((fst x,fst line),digitToInt $ snd x)) $ snd line) . Bi.second (zip [0..])) $ zip [0..] $ lines input
--mapWithKey