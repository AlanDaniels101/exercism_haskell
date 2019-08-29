module Series (slices) where

import Data.List

slices :: Int -> String -> [[Int]]
slices 0 xs = take (length xs + 1) $ repeat ([] ++ [])
slices _ [] = []
slices n xs = let ds = map (read . (:"")) xs :: [Int] in
                map (take n)
                . take (length ds - n + 1)
                . tails $ ds
