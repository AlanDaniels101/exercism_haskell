module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock { h :: Int
                   , m :: Int } deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = 
    let hours = (hour + (min `div` 60)) `mod` 24
        mins = min `mod` 60
    in
        Clock { h = hours, m = mins }

toString :: Clock -> String
toString clock = to2d (h clock) ++ ":" ++ (to2d $ m clock)

to2d :: Int -> String
to2d num
    | num < 10 = "0" ++ show num
    | otherwise = show num

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = 
    let hours = hour + h clock
        mins = min + m clock
    in 
        fromHourMin hours mins
