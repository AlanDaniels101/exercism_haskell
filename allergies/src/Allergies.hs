module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Bits

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Show, Enum, Bounded)

allergies :: Int -> [Allergen]
allergies score = filter (\allergen -> isAllergicTo allergen score) [minBound :: Allergen .. maxBound :: Allergen]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = testBit score (fromEnum allergen)
