module Bob (responseFor) where

import Data.Char

withoutWhitespace :: String -> String
withoutWhitespace sentence = filter (not . isSpace) sentence

question :: String -> Bool
question xs = (last xs == '?')

yell :: String -> Bool
yell xs =
    let letters = filter isLetter xs
    in not (null letters) && all isUpper letters

responseFor :: String -> String
responseFor sentence
    | null s = "Fine. Be that way!"
    | question s && yell s = "Calm down, I know what I'm doing!"
    | question s = "Sure."
    | yell s = "Whoa, chill out!"
    | otherwise = "Whatever."
    where s = withoutWhitespace sentence
    
