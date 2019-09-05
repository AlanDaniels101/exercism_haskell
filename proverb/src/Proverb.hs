module Proverb(recite) where

import Data.List (intercalate)

recite :: [String] -> String
recite [] = ""
recite [x] = "And all for the want of a " ++ x ++ "."
recite xs = let pairs = zip xs (tail xs) in
                intercalate "\n" (map line pairs) ++ "\n" ++ recite [head xs]

line :: (String, String) -> String
line (x, y) = "For want of a " ++ x ++ " the " ++ y ++ " was lost."