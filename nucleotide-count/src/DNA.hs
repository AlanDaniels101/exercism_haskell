module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, insertWith)
import Control.Monad
import Text.Read

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

incrementCount :: (Map Nucleotide Int) -> Char -> Either String (Map Nucleotide Int)
incrementCount m c = case readMaybe [c] :: Maybe Nucleotide of
    Just n -> Right $ insertWith (+) n 1 m
    Nothing -> Left [c]

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldM incrementCount (fromList [(A, 0), (C, 0), (G, 0), (T, 0)]) xs 
