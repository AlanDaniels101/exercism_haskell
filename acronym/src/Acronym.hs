module Acronym (abbreviate) where

import Data.Char

isAcronymDelimiter :: Char -> Bool
isAcronymDelimiter char
    | char == ' ' = True
    | char == '-' = True
    | otherwise = False

fstCharLower :: (Char, Char) -> Bool
fstCharLower chars = isLower $ fst chars

sndCharUpper :: (Char, Char) -> Bool
sndCharUpper chars = isUpper $ snd chars

startsAcronym :: (Char, Char) -> Bool
startsAcronym chars 
    | (isAcronymDelimiter $ fst chars) && not (isAcronymDelimiter $ snd chars) = True
    | fstCharLower chars && sndCharUpper chars = True 
    | otherwise = False

-- Converts a string to pairs of two consecutive characters
-- e.g. : "Hi !" -> (' ', 'H'), ('H', 'i'), ('i', ' '), (' ', '!')
toPairs :: String -> [(Char, Char)]
toPairs s = zip (' ':s) s

abbreviate :: String -> String
abbreviate s = [ toUpper $ snd pair | pair <- toPairs s, startsAcronym pair]
