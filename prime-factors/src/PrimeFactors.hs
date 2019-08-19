module PrimeFactors (primeFactors) where

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n = genPrimeFactors n 2 []

genPrimeFactors :: Integer -> Integer -> [Integer] -> [Integer]
genPrimeFactors n divisor factors = if (n == divisor) 
                                        then factors ++ [n]
                                        else
                                            if (n `rem` divisor == 0)
                                                then genPrimeFactors (n `div` divisor) divisor (factors ++ [divisor])
                                                else genPrimeFactors n (divisor + 1) factors