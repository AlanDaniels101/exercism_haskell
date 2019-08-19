module Yacht (yacht, Category(..)) where

import Data.List

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

numOfFirst :: [Int] -> Int
numOfFirst dice = length . filter (== head dice) $ dice

numUnique :: [Int] -> Int
numUnique = length . nub

yacht :: Category -> [Int] -> Int
-- yacht category dice = error "You need to implement this function."
yacht Ones dice     = sum . filter (== 1) $ dice
yacht Twos dice     = sum . filter (== 2) $ dice
yacht Threes dice   = sum . filter (== 3) $ dice
yacht Fours dice    = sum . filter (== 4) $ dice
yacht Fives dice    = sum . filter (== 5) $ dice
yacht Sixes dice    = sum . filter (== 6) $ dice
yacht FullHouse dice =  if (numUnique dice == 2 && 
                            (numOfFirst dice == 2 || numOfFirst dice == 3))
                        then sum dice else 0
yacht FourOfAKind dice = if (numUnique dice == 2) then
                            if (numOfFirst dice == 4)
                                then sum . filter (== head dice) $ dice
                                else 
                                    if (numOfFirst dice == 1)
                                        then sum . filter (== last dice) $ dice
                                        else 0
                         else
                            if (numUnique dice == 1)
                                then 4 * head dice
                                else 0
yacht LittleStraight dice = if (numUnique dice == 5 &&
                                minimum dice == 1 &&
                                maximum dice == 5) 
                            then 30 else 0
yacht BigStraight dice =    if (numUnique dice == 5 &&
                             minimum dice == 2 &&
                             maximum dice == 6)
                            then 30 else 0                  
yacht Choice dice = sum dice
yacht Yacht dice = if (numUnique dice == 1) then 50 else 0