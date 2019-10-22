module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Empty | Node a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Node a l r) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Node a l r) = Just r

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (Node a l r) = Just a 

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList = foldr insert Empty . reverse

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (Node a l r)
    | x <= a = Node a (insert x l) r
    | x > a  = Node a l (insert x r) 

singleton :: a -> BST a
singleton x = Node x Empty Empty

toList :: BST a -> [a]
toList Empty = []
toList (Node a l r) = (toList l) ++ (a : (toList r))
