module ArmstrongNumbers (armstrong) where

import Data.Digits

armstrong :: (Integral a, Show a) => a -> Bool
armstrong x = 
    let numDigits = length $ show x 
        sumPowers = sum $ map (^numDigits) $ digits 10 x
    in x == sumPowers
