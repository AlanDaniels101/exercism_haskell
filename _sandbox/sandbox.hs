import Data.List
import Data.Map

numUniques :: (Eq a) => [a] -> Int  
numUniques = length . nub  