module Luhn (isValid) where

import Data.Char

isValid :: String -> Bool
isValid n = let noSpaces = filter (not . isSpace) $ n 
            in isValidSequence noSpaces &&
            let digitList = map (read . (:"")) (reverse noSpaces) :: [Int]
                adjustedDigits = zipWith ($) (cycle [id, adjustment]) digitList  -- apply the adjustment every other digit
            in  (sum adjustedDigits) `rem` 10 == 0

adjustment :: Int -> Int
adjustment x =  let doubled = x * 2 in
                if doubled > 9 then doubled - 9
                else doubled

isValidSequence :: String -> Bool
isValidSequence xs = all isDigit xs && 
                     length xs > 1
