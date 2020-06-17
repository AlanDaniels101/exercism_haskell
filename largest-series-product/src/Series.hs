module Series (Error(..), largestProduct) where

import Data.List.Split (divvy)
import Data.Char (isDigit, digitToInt)
import Control.Monad (mapM)

data Error = InvalidSpan | InvalidDigit Char deriving (Show, Eq)

largestProduct :: Int -> String -> Either Error Int
largestProduct size digits
    | size < 0              = Left InvalidSpan
    | size == 0             = Right 1
    | size > length digits  = Left InvalidSpan
    | otherwise             = maxProduct <$> (divvy size 1) <$> toDigitList digits 

maxProduct :: [[Int]] -> Int
maxProduct = maximum . map product

toDigitList :: String -> Either Error [Int]
toDigitList = mapM toDigitM

toDigitM :: Char -> Either Error Int
toDigitM c = if (isDigit c) 
                then Right $ digitToInt c
                else Left $ InvalidDigit c