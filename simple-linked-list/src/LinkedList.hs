module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Empty | Datum a (LinkedList a) deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Datum x tail) = x

fromList :: [a] -> LinkedList a
fromList [] = Empty
fromList (x:xs) = x `Datum` (fromList xs)

isNil :: LinkedList a -> Bool
isNil (Empty) = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x linkedList = Datum x linkedList

next :: LinkedList a -> LinkedList a
next (Datum x tail) = tail

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

toList :: LinkedList a -> [a]
toList Empty = []
toList (Datum x tail) = x:(toList tail)
