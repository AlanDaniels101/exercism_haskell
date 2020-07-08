module OCR (convert) where

import Control.Monad.Catch
import Data.Bimap (fromList, lookupR)
import Data.List (intercalate, transpose)
import Data.List.Split (chunksOf)

ocr = fromList [
    ("0",
    [ " _ "
    , "| |"
    , "|_|"
    , "   " ]),
    ("1",
    [ "   "
    , "  |"
    , "  |"
    , "   " ]),
    ("2",
    [ " _ "
    , " _|"
    , "|_ "
    , "   " ]),
    ("3",
    [ " _ "
    , " _|"
    , " _|"
    , "   " ]),
    ("4",
    [ "   "
    , "|_|"
    , "  |"
    , "   " ]),
    ("5",
    [ " _ "
    , "|_ "
    , " _|"
    , "   " ]),
    ("6",
    [ " _ "
    , "|_ "
    , "|_|"
    , "   " ]),
    ("7",
    [ " _ "
    , "  |"
    , "  |"
    , "   " ]),
    ("8",
    [ " _ "
    , "|_|"
    , "|_|"
    , "   " ]),
    ("9",
    [ " _ "
    , "|_|"
    , " _|"
    , "   " ])
    ]

-- Convert a block of OCR numbers (3N x 4K) - rows are joined by a comma
convert :: String -> String
convert xs = intercalate "," (map convertList ((chunksOf 4) . lines $ xs))

-- Convert a line of OCR numbers (3N x 4)
convertList :: [String] -> String
convertList xs = concatMap convertOne (transpose . map (chunksOf 3) $ xs)

-- Convert an OCR number in the form in the ocr bimap (3 x 4)
convertOne :: [String] -> String
convertOne xs = case lookupR xs ocr :: Maybe String of
                Just x -> x
                Nothing -> "?"