module SumOfMultiples (sumOfMultiples) where

import Data.List
import Data.Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . unions . Data.List.map (multiples limit) $ factors

multiples :: Integer -> Integer -> Set Integer
multiples _ 0 = fromDistinctAscList  [0]
multiples limit n = fromDistinctAscList [n, 2*n..limit-1] 