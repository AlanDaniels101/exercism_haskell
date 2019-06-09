module Triplet (tripletsWithSum) where

import Math.NumberTheory.Powers.Squares

tripletsWithSum :: Int -> [(Int, Int, Int)]
-- tripletsWithSum n = [(a,b,c) | a <- [1..1000], b <- [1..1000], c <- [1..1000], a < b, b < c, a^2 + b^2 == c^2, a + b + c == n] -- slow
tripletsWithSum n = 
    let limA = n `div` 3
        limB = n `div` 2
    in [(a,b,c) | a <- [1..limA], b <- [(a+1)..limB], let c = n - b - a, a^2 + b^2 == c^2] -- not super fast