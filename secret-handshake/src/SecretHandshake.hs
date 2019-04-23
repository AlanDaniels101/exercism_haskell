module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n =
    let events = toEvents n in
        if not (testBit n 4) then
            reverse events
        else
            events

toEvents :: Int -> [String]
toEvents n = if testBit n 3 then
                ["jump"] ++ toEvents (clearBit n 3)
             else 
                if testBit n 2 then
                    ["close your eyes"] ++ toEvents (clearBit n 2)
                else
                    if testBit n 1 then
                        ["double blink"] ++ toEvents (clearBit n 1)
                    else
                        if testBit n 0 then
                            ["wink"]
                        else 
                            []