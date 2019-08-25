module Series (Error(..), largestProduct) where

import Data.List
import Data.Char (isDigit)

data Error = InvalidSpan | InvalidDigit Char deriving (Show, Eq)

largestProduct :: Int -> String -> Either Error Int
largestProduct size digits
    | size < 0              = Left InvalidSpan
    | size == 0             = Right 1
    | size <= length digits = case (toDigitList digits) of
                                Left err    -> Left err
                                Right xs    -> Right $ maximum
                                            . map (product . take size)
                                            . take (length digits - size + 1)
                                            . tails $ xs
    | otherwise = Left InvalidSpan

toDigitList :: String -> Either Error [Int]
toDigitList s = case (find (not . isDigit) s) of
                    Just d      -> Left $ InvalidDigit d
                    otherwise   -> Right $ map (read . (:"")) s