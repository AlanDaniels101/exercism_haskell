module Triangle (rows) where

row :: Int -> [Integer]
row 0 = []
row 1 = [1]
row 2 = [1,1]
row n = 
    let r = row (n - 1)
        r1 = 1:r
        r2 = 0:((tail r) ++ [0])
    in zipWith (+) r1 r2

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [row 1]
rows x = rows (x - 1) ++ [row x]
