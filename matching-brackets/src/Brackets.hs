module Brackets (arePaired) where

arePaired :: String -> Bool
arePaired xs = null $ foldl removeMatching [] $ filter (`elem` "({[]})") xs

removeMatching :: String -> Char -> String
removeMatching ('(' : xs) ')' = xs
removeMatching ('{' : xs) '}' = xs
removeMatching ('[' : xs) ']' = xs
removeMatching (xs) x         = x:xs