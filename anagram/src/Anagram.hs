module Anagram (anagramsFor) where

import Data.List
import Data.Char

isAnagram :: String -> String -> Bool
isAnagram word candidate =
    let w = map toLower word
        c = map toLower candidate
    in (w /= c) && (w \\ c == "") && (c \\ w == "")

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (isAnagram xs) xss
