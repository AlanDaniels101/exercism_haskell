module Isogram (isIsogram) where

import Data.Char
import Data.List

isIsogram :: String -> Bool
isIsogram xs = 
    let alphaOnly = filter isAlpha $ map toLower xs in
        length alphaOnly == (length $ nub alphaOnly)
