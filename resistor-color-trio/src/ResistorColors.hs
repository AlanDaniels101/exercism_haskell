module ResistorColors (Color(..), Resistor(..), label, ohms) where

import Data.Char

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

data Prefix =
    Kilo
  | Mega
  | Giga
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

digits :: Int -> Int
digits = length . show

div' :: Int -> Int -> String
div' n divisor
  | n `rem` divisor == 0 = show $ n `div` divisor
  | otherwise = show $ (fromIntegral n) / (fromIntegral divisor)

-- 1100 -> 1.1 kilo 
si :: Int -> String
si n
  | prefix == 0 = show n ++ " " 
  | otherwise = n `div'` (10^(prefix*3)) ++ (' ':map toLower (show (toEnum (prefix - 1) :: Prefix)))
  where prefix = min (fromEnum (maxBound::Prefix) + 1) (((digits n) - 1) `div` 3)


label :: Resistor -> String
label resistor = (si $ ohms resistor) ++ "ohms"

ohms :: Resistor -> Int
ohms resistor = let (a, b, c) = bands resistor in
              (10 * fromEnum a + fromEnum b) * 10 ^ fromEnum c
