module Grains (square, total) where

grains :: [Integer]
grains = take 64 $ iterate (*2) 1

square :: Int -> Maybe Integer
square n
    | n < 1 = Nothing
    | n > 64 = Nothing
    | otherwise = Just $ grains !! (n - 1)

total :: Integer
total = sum grains