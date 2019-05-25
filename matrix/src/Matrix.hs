module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import qualified Data.Vector as V

data Matrix a = Matrix { rows :: Int
                       , cols :: Int
                       , v :: (V.Vector a)
                       } deriving (Eq, Show)

-- cols :: Matrix a -> Int
-- cols matrix = error "You need to implement this function."

column :: Int -> Matrix a -> V.Vector a
column x matrix = row x $ transpose matrix

flatten :: Matrix a -> V.Vector a
flatten matrix = v matrix

fromList :: [[a]] -> Matrix a
fromList [[]] = Matrix { rows = 0, cols = 0, v = V.fromList [] }
fromList xss = 
    let r = length xss
        c = length (xss !! 0)
    in Matrix { rows = r, cols = c, v = V.fromList (concat xss)}

fromString :: Read a => String -> Matrix a
fromString "" = fromList [[]]
fromString xs = fromList $ map (map read . words) $ lines xs

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (newRows, newCols) matrix = Matrix { rows = newRows, cols = newCols, v = (v matrix) }

row :: Int -> Matrix a -> V.Vector a
row x matrix = let c = cols matrix in V.slice (x * c) c (v matrix)

-- rows :: Matrix a -> Int
-- rows matrix = error "You need to implement this function."

shape :: Matrix a -> (Int, Int)
shape matrix = (rows matrix, cols matrix)

groupN :: Int -> [a] -> [[a]]
groupN _ [] = []
groupN n xs = take n xs : groupN n (drop n xs)

tpose :: [[a]] -> [[a]]
tpose [] = []
tpose ([]:xss) = tpose xss
tpose ((x:xs) : xss) = (x : [h | (h:_) <- xss]) : tpose (xs : [t | (_:t) <- xss])

transpose :: Matrix a -> Matrix a
transpose matrix =
    let newRows = cols matrix
        newCols = rows matrix
        orig = groupN (cols matrix) (V.toList (v matrix))
    in Matrix { rows = newRows, cols = newCols, v = V.fromList (concat . tpose $ orig) }