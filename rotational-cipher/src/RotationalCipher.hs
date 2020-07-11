module RotationalCipher (rotate) where

import Data.Char

rotate :: Int -> String -> String
rotate n = map (r n)

r :: Int -> Char -> Char
r n c
    | isAlpha c = let s = ord . start $ c in chr ((ord c - s + n) `rem` 26 + s)
    | otherwise = c

start :: Char -> Char
start c
    | isUpper c = 'A'
    | isLower c = 'a'