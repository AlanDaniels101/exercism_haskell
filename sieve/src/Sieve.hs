module Sieve (primesUpTo) where

import Data.Set (difference, empty, fromAscList, toList, union)

-- You should not use any of the division operations when implementing
-- the sieve of Eratosthenes.
import Prelude hiding (div, mod, divMod, rem, quotRem, quot, (/))

primesUpTo :: Integer -> [Integer]
primesUpTo n =  let m = map (\x -> multiples x n) [2..n]
                    candidates = fromAscList $ map head m
                    invalid = foldr (union . fromAscList) empty (map tail m)
                in toList $ candidates `difference` invalid

multiples :: Integer -> Integer -> [Integer]
multiples n lim = takeWhile (<= lim) [n, 2*n..]