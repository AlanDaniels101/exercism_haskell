module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n <= 0 = Nothing
    | n == 1 = Just 2
    | otherwise = Just $ fromIntegral $ (filter isPrime [2..]) !! (n-1) 

isPrime :: Int -> Bool
isPrime n = let lim = floor . sqrt . fromIntegral $ n
            in all (/= 0) $ map (\f -> n `rem` f) [2..lim]