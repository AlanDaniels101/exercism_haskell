module ProteinTranslation(proteins) where

codonToProtein :: String -> String
codonToProtein "AUG" = "Methionine"
codonToProtein "UUU" = "Phenylalanine"
codonToProtein "UUC" = "Phenylalanine"
codonToProtein "UUA" = "Leucine"
codonToProtein "UUG" = "Leucine"
codonToProtein "UCU" = "Serine"
codonToProtein "UCC" = "Serine"
codonToProtein "UCA" = "Serine"
codonToProtein "UCG" = "Serine"
codonToProtein "UAU" = "Tyrosine"
codonToProtein "UAC" = "Tyrosine"
codonToProtein "UGU" = "Cysteine"
codonToProtein "UGC" = "Cysteine"
codonToProtein "UGG" = "Tryptophan"
codonToProtein "UAA" = "STOP"
codonToProtein "UAG" = "STOP"
codonToProtein "UGA" = "STOP"

group3 :: String -> [String]
group3 [] = []
group3 xs = take 3 xs : group3 (drop 3 xs)

proteins :: String -> Maybe [String]
proteins xs = Just $ takeWhile (/= "STOP") $ map codonToProtein (group3 xs)
