module Matrix (saddlePoints) where

import Data.Array
import Data.List

xss :: [[Int]]
xss = [ [9, 8, 7]
      , [5, 3, 2]
      , [6, 6, 7] ]

rows      = length xss
columns   = length $ head xss
m    = listArray ((0, 0), (rows - 1, columns - 1)) (concat xss)

groupN :: Int -> [a] -> [[a]]
groupN _ [] = []
groupN n xs = take n xs : groupN n (drop n xs)

toCol :: [[a]] -> Int -> [a]
toCol [] _ = []
toCol xs n = map (!! n) xs

findMax :: [((Int,Int),Int)] -> Int
findMax [] = 0
findMax a = maximum $ map (snd) a

rowToMaxes :: [((Int,Int),Int)] -> [(Int,Int)]
rowToMaxes [] = []
rowToMaxes a =
    let max = findMax a
    in map fst $ filter (\x -> snd x == max) a

maxInRowPoints :: [[((Int,Int),Int)]] -> [(Int,Int)]
maxInRowPoints matrix = concatMap (rowToMaxes) matrix

findMin :: [((Int,Int),Int)] -> Int
findMin [] = 0
findMin a = minimum $ map snd a

colToMins :: [((Int,Int),Int)] -> [(Int,Int)]
colToMins [] = []
colToMins a = 
    let min = findMin a
    in map fst $ filter (\x -> snd x == min) a

minInColPoints :: [[((Int,Int),Int)]] -> [(Int,Int)]
minInColPoints matrix = concatMap (colToMins) matrix

saddlePoints :: Array ((Int),(Int)) Int -> [(Int,Int)]
saddlePoints matrix = 
    let ((lr,lc),(ur,uc)) = bounds matrix
        rows = groupN (uc + 1) (assocs matrix)
        cols = map (toCol rows) [0..uc]
        maxRowPoints = maxInRowPoints rows
        minColPoints = minInColPoints cols
    in intersect maxRowPoints minColPoints