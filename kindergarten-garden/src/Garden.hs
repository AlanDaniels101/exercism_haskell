module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import qualified Data.Map as Map
import Data.List

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

type Student = String
type Garden = Map.Map Student [Plant]

letterToPlant :: Char -> Plant
letterToPlant 'C' = Clover
letterToPlant 'G' = Grass
letterToPlant 'R' = Radishes
letterToPlant 'V' = Violets
letterToPlant other = error "Invalid plant type."

group2 :: [a] -> [[a]]
group2 [] = []
group2 xs = take 2 xs : group2 (drop 2 xs)

garden :: [String] -> String -> Garden
garden students plants = 
    let r1 = head $ lines plants
        r2 = last $ lines plants
        letters = zipWith (++) (group2 r1) (group2 r2)
        plantList = map (map letterToPlant) letters
    in Map.fromList $ zip students plantList

lookupPlants :: String -> Garden -> [Plant]
lookupPlants student garden =
    case Map.lookup student garden of
        Just plants -> plants
        Nothing -> []
