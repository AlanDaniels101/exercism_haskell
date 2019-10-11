module WordCount (wordCount) where

import Data.List
import Data.Char

wordCount :: String -> [(String, Int)]
wordCount xs = let l = words' xs in
                   map (countWord l) (nub l)

countWord :: [String] -> String -> (String, Int)
countWord l word = (word, length . filter (== word) $ l)

fil :: Char -> Bool
fil x = isAlphaNum x || x == '\''

trimquotes :: String -> String
trimquotes "" = ""
trimquotes xs = if head xs == '\'' && last xs == '\'' then init (tail xs) else xs

words' :: String -> [String]
words' xs = map trimquotes
            . filter (/= "")
            . map (filter fil)
            . words
            . map (\x -> if x == ',' then ' ' else toLower x) $xs