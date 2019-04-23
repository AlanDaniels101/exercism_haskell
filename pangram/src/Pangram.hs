module Pangram (isPangram) where

import Data.List
import Data.Char

isPangram :: String -> Bool
isPangram text = ['a'..'z'] `intersect` map toLower text == ['a'..'z']
