module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop
    | start < stop = [line start] ++ recite (start+1) stop
    | otherwise = [line start]

ord = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
gift = ["a Partridge in a Pear Tree.",
        "two Turtle Doves, and ",
        "three French Hens, ",
        "four Calling Birds, ",
        "five Gold Rings, ",
        "six Geese-a-Laying, ",
        "seven Swans-a-Swimming, ",
        "eight Maids-a-Milking, ",
        "nine Ladies Dancing, ",
        "ten Lords-a-Leaping, ",
        "eleven Pipers Piping, ",
        "twelve Drummers Drumming, "]

line :: Int -> String
line n = "On the " ++ ord !! (n-1) ++ " day of Christmas my true love gave to me: " ++ gifts (n-1)

gifts :: Int -> String
gifts n
    | n == 0 = gift !! n
    | otherwise = gift !! n ++ gifts (n-1)

