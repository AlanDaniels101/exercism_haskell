module Scrabble (scoreLetter, scoreWord) where

import Data.Char

scoreLetter :: Char -> Integer
scoreLetter l
    | letter `elem` ['A','E','I','O','U','L','N','R','S','T'] = 1
    | letter `elem` ['D','G'] = 2
    | letter `elem` ['B','C','M','P'] = 3
    | letter `elem` ['F','H','V','W','Y'] = 4
    | letter `elem` ['K'] = 5
    | letter `elem` ['J','X'] = 8
    | letter `elem` ['Q','Z'] = 10
    | otherwise = 0
    where letter = toUpper l

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter 
