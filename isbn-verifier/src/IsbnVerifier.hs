module IsbnVerifier (isbn) where

import Data.Char

ms :: String -> Int -> Int
ms code index
    | index == 10 = 0
    | otherwise = digit * (10-index) + ms code (index+1)
    where digit = dig2int $ code !! index

dig2int :: Char -> Int
dig2int c 
    | c == 'X' = 10
    | otherwise = digitToInt c

verify :: String -> Bool
verify code = ms code 0 `rem` 11 == 0

isbn :: String -> Bool
isbn s
    | length code /= 10 = False
    | all isDigit code = verify code
    | all isDigit (take 9 code) && last code == 'X' = verify code
    | otherwise = False
    where code = filter isAlphaNum s
