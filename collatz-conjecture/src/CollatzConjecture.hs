module CollatzConjecture (collatz) where

import Data.List
import Data.Maybe

calcCollatz :: Integer -> Integer
calcCollatz n
    | even n = n `quot` 2
    | otherwise = 3*n+1

-- Generates infinite collatz sequence. The index of the first 1 is the number of steps to reach 1.  
collatz :: Integer -> Maybe Integer
collatz n
    | n < 1 = Nothing
    | otherwise = Just $ toInteger $ fromMaybe 0 (elemIndex 1 $ iterate calcCollatz n)
