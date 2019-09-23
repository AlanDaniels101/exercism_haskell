module BinarySearch (find) where

import Data.Array

find :: Ord a => Array Int a -> a -> Maybe Int
find arr x
    | l == [] = Nothing
    | x == midVal = Just midIndex
    | x <= midVal = let size = midIndex - lower
                        lowerHalf = listArray (lower, midIndex - 1) (take size l)
                    in  find lowerHalf x
    | otherwise   = let start = midIndex - lower + 1
                        upperHalf = listArray (midIndex + 1, upper) (drop start l)
                    in  find upperHalf x
    where l = elems arr
          (lower, upper) = bounds arr
          midIndex = (lower + upper) `div` 2  
          midVal = arr ! midIndex
