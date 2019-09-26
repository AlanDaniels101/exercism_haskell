module Atbash (decode, encode) where

import Data.Char
import Data.List

groupN :: Int -> String -> [String]
groupN _ [] = []
groupN n xs = take n xs : groupN n (drop n xs)

convert :: Char -> Char
convert x
    | isSpace x = x
    | isDigit x = x
    | isAlpha x =   let offset = (ord . toLower $ x) - ord 'a'
                    in chr (ord 'z' - offset) 
    | otherwise = error "Invalid character."

encode :: String -> String
encode =    map convert
            . intercalate " "
            . groupN 5 
            . filter isAlphaNum

decode :: String -> String
decode =    map convert
            . filter isAlphaNum