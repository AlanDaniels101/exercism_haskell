module Raindrops (convert) where

convert :: Int -> String
convert n
    | null drops = show n
    | otherwise = drops
    where drops = (if n `rem` 3 == 0 then "Pling" else "") ++
                  (if n `rem` 5 == 0 then "Plang" else "") ++
                  (if n `rem` 7 == 0 then "Plong" else "") 
