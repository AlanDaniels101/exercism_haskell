module RunLength (decode, encode) where

import Data.List
import Data.Char

decode :: String -> String
decode encodedText = case (findIndex (not . isDigit) encodedText) of
    Just 0 -> [head encodedText] ++ decode (tail encodedText)
    Just x -> replicate num letter ++ decode remaining
        where num = read (take x encodedText) :: Int
              letter = encodedText !! x
              remaining = drop (x+1) encodedText
    Nothing -> encodedText

encode :: String -> String
encode text = concatMap encodeRepeatingLetter (groupBy (==) text)

encodeRepeatingLetter :: String -> String
encodeRepeatingLetter xs = prefix (length xs) ++ [xs !! 0]
    where prefix n = if n == 1 then "" else show n 
