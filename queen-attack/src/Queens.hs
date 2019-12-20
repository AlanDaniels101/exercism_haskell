module Queens (boardString, canAttack) where

import Data.List

board :: String -> String
board xs = (lineify 111 . intersperse ' ' $ xs) ++ ['\n']

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing                 = board emptyBoard
boardString (Just (wY, wX)) Nothing         = board $ replaceNth (wX + 8*wY) 'W' emptyBoard
boardString Nothing (Just (bY, bX))         = board $ replaceNth (bX + 8*bY) 'B' emptyBoard
boardString (Just (wY, wX)) (Just (bY, bX)) = board $ replaceNth (wX + 8*wY) 'W' (replaceNth (bX + 8*bY) 'B' emptyBoard)

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (aX, aY) (bX, bY) = if (aX == bX) then True   -- same rank
                              else if (aY == bY) then True   -- same file
                                else if (abs(bX-aX) == abs(bY-aY)) then True   -- same diagonal
                                  else False

emptyBoard = (take 64 $ repeat '_')

replaceNth :: Int -> a -> [a] -> [a]
replaceNth _ _ [] = []
replaceNth 0 a (x:xs) = a:xs
replaceNth n a (x:xs) = x : replaceNth (n-1) a xs

lineify :: Int -> String -> String
lineify n xs = if (n < 0) then xs else lineify (n-16) (replaceNth n '\n' xs)