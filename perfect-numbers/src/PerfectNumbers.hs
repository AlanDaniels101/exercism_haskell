module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify num
    | num <= 0 = Nothing
    | aliquotSum < num = Just Deficient
    | aliquotSum > num = Just Abundant
    | otherwise = Just Perfect
    where aliquotSum = sum $ properDivisors num

properDivisors :: Int -> [Int]
properDivisors num = [n | n <- [1..(num `div` 2)], num `rem` n == 0]
