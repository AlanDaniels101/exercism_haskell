module Base (Error(..), rebase) where

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits
    | inputBase < 2 = Left InvalidInputBase
    | outputBase < 2 = Left InvalidOutputBase
    | inputDigits == [] = Right []
    | minimum inputDigits < 0 = Left $ InvalidDigit (minimum inputDigits)
    | maximum inputDigits >= inputBase = Left $ InvalidDigit (maximum inputDigits)
    | otherwise = let base10 = toBase10 inputBase inputDigits in
        Right $ fromBase10 outputBase base10

toBase10 :: Integral a => a -> [a] -> a
toBase10 base digits = sum $ zipWith (*) (reverse digits) (map (\x -> base^x) [0..])

fromBase10 :: Integral a => a -> a -> [a]
fromBase10 base num = 
    let multiples = reverse $ takeWhile (<=num) (map (\x -> base^x) [0..]) in
        toDigits num multiples []

toDigits :: Integral a => a -> [a] -> [a] -> [a]
toDigits _ [] digits = digits
toDigits 0 multiplesOfBase digits = toDigits 0 (tail multiplesOfBase) (digits ++ [0])
toDigits num multiplesOfBase digits = 
    let m = num `div` (head multiplesOfBase)
        r = num `rem` (head multiplesOfBase)    
    in
        toDigits r (tail multiplesOfBase) (digits ++ [m])