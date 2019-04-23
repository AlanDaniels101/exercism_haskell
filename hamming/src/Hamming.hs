module Hamming (distance) where

numMatches :: String -> String -> Int
numMatches xs ys = 
    let pairs = zip xs ys
    in length [matches | matches <- pairs, fst matches == snd matches]

distance :: String -> String -> Maybe Int
distance xs ys
    | length xs /= length ys = Nothing
    | otherwise = Just $ length xs - numMatches xs ys
