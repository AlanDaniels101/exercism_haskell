module Diamond (diamond) where

import Data.Char

diamond :: Char -> Maybe [String]
diamond c =
    let totalWidth = ( (ord c) - (ord 'A') ) * 2 + 1 in
        Just $ genUpperDiamond c totalWidth ++ (tail $ genLowerDiamond c totalWidth)

repeatN :: Int -> a -> [a]
repeatN n xs = take n $ repeat xs

nSpaces :: Int -> String
nSpaces n = repeatN n ' '

genUpperDiamond :: Char -> Int -> [String]
genUpperDiamond 'A' width = genDiamond 'A' width
genUpperDiamond c width = genUpperDiamond (pred c) width ++ (genDiamond c width)

genLowerDiamond :: Char -> Int -> [String]
genLowerDiamond 'A' width = genDiamond 'A' width
genLowerDiamond c width = genDiamond c width ++ (genLowerDiamond (pred c) width) 

genDiamond :: Char -> Int -> [String]
genDiamond 'A' width = [nSpaces (width `div` 2) ++ "A" ++ (nSpaces $ width `div` 2)]
genDiamond current width = 
    let innerSpaces = ( (ord current) - (ord 'A') ) * 2 - 1
        outerSpaces = (width - 2 - innerSpaces) `div` 2    
    in
        [nSpaces outerSpaces ++ [current] ++ nSpaces innerSpaces ++ [current] ++ nSpaces outerSpaces]