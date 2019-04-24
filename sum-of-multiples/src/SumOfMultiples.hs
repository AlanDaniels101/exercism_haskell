module SumOfMultiples (sumOfMultiples) where

import Data.List

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . nub . concat $ map (multiples limit) factors

multiples :: Integer -> Integer -> [Integer]
multiples limit 0 = [0]
multiples limit n = unfoldr (\x -> if (x >= limit) then Nothing else Just (x, x+n)) n 