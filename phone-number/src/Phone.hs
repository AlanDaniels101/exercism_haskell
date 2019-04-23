module Phone (number) where

import Data.Char

validNum :: String -> Bool
validNum xs = digitToInt (xs !! 0) > 1 && (digitToInt (xs !! 3) > 1)

number :: String -> Maybe String
number xs
    | length digits == 11 && head digits == '1' && validNum (drop 1 digits) = Just $ drop 1 digits
    | length digits == 10 && validNum digits = Just digits
    | otherwise = Nothing
    where digits = filter isDigit xs 
