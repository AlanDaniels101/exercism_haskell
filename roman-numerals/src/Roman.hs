module Roman (numerals) where

import qualified Data.Map as Map

rNums = Map.fromList [(1,"I")
                     ,(4,"IV")
                     ,(5,"V")
                     ,(9,"IX")
                     ,(10,"X")
                     ,(40,"XL")
                     ,(50,"L")
                     ,(90,"XC")
                     ,(100,"C")
                     ,(400,"CD")
                     ,(500,"D")
                     ,(900,"CM")
                     ,(1000,"M")]

numerals :: Integer -> Maybe String
numerals 0 = Just ""
numerals n = 
    let val = maximum $ filter (<= n) (Map.keys rNums)
    in (++) <$> (Map.lookup val rNums) <*> (numerals (n - val))

