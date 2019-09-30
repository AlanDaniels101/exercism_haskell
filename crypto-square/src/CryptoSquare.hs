module CryptoSquare (encode) where

import Data.Char
import Data.List

encode :: String -> String
encode xs = let n = normalize xs
                (r,c) = rectDim n
                p = n ++ (take (r*c - length n) $ repeat ' ')
                g = groupN c p
            in intercalate " " . transpose $ g

normalize :: String -> String
normalize = map toLower . filter isAlphaNum

groupN :: Int -> String -> [String]
groupN n [] = []
groupN n xs = take n xs : groupN n (drop n xs)

rectDim :: String -> (Int, Int)
rectDim xs = let r = floor . sqrt . fromIntegral . length $ xs in
                 if (r*r < length xs) 
                    then (r,r+1)
                    else (r,r)