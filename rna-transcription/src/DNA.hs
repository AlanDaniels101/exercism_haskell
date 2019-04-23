module DNA (toRNA) where

complement :: Char -> Either Char Char
complement 'G' = Right 'C'
complement 'C' = Right 'G'
complement 'T' = Right 'A'
complement 'A' = Right 'U'
complement other = Left other

toRNA :: String -> Either Char String
toRNA xs = traverse complement xs