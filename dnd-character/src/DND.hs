module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, choose, generate)

data Character = Character
  { name         :: String
  , strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier c = (c - 10) `div` 2 

ability :: Gen Int
ability = do
    r1 <- choose (1,6)
    r2 <- choose (1,6)
    r3 <- choose (1,6)
    r4 <- choose (1,6)
    let rolls = [r1,r2,r3,r4]
    return $ (sum rolls) - (minimum rolls)

character :: Gen Character
character = do
    let n = "Bob"
    str <- ability
    dex <- ability
    con <- ability
    int <- ability
    wis <- ability
    char <- ability
    let hp = 10 + modifier con 
    return Character {  name = n,
                        strength = str,
                        dexterity = dex,
                        constitution = con,
                        intelligence = int,
                        wisdom = wis,
                        charisma = char,
                        hitpoints = hp
                     }
