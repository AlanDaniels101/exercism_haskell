module Triangle (TriangleType(..), triangleType) where

import Data.List

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  | Degenerate
                  deriving (Eq, Show)

triangleType :: (Ord a, Num a) => a -> a -> a -> TriangleType
triangleType a b c =
    let sides = [a,b,c] in
    let smallSideSum = sum sides - maximum sides in
    case compare smallSideSum $ maximum sides of
        LT -> Illegal
        EQ -> if (a /= 0) then Degenerate else Illegal
        GT -> case length $ nub sides of
                1 -> Equilateral
                2 -> Isosceles
                3 -> Scalene
                
