module House (rhyme) where

subjects = ["house that Jack built.",
            "malt",
            "rat",
            "cat",
            "dog",
            "cow with the crumpled horn",
            "maiden all forlorn",
            "man all tattered and torn",
            "priest all shaven and shorn",
            "rooster that crowed in the morn",
            "farmer sowing his corn",
            "horse and the hound and the horn"]

descs = ["lay in",
        "ate",
        "killed",
        "worried",
        "tossed",
        "milked",
        "kissed",
        "married",
        "woke",
        "kept",
        "belonged to"]

line :: Int -> Int -> String
line n total
    | n == total = "This is the " ++ (subjects !! n)
    | otherwise = "that " ++ (descs !! n) ++ " the " ++ (subjects !! n)

recite :: Int -> Int -> String
recite 0 11    = line 0 11
recite 0 total = line 0 total ++ "\n"
recite n total = line n total ++ "\n" ++ recite (n-1) total

rhyme :: String
rhyme = unlines $ map (\x -> recite x x) [0..11]