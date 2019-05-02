module ETL (transform) where

import qualified Data.Map as Map
import Data.Char

transform :: Map.Map a String -> Map.Map Char a
transform legacyData = Map.fromList (concatMap groupWithScore (Map.toList legacyData))

groupWithScore :: (a, String) -> [(Char, a)]
groupWithScore (score, xs) = map (\c -> (toLower c, score)) xs