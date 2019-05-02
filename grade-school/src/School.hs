module School (School, add, empty, grade, sorted) where

import Data.List
import qualified Data.Map as Map

type School = Map.Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student school = Map.insertWith (insert') gradeNum [student] school

insert' :: Ord a => [a] -> [a] -> [a]
insert' new xs = insert (new !! 0) xs

empty :: School
empty = Map.fromList []

grade :: Int -> School -> [String]
grade gradeNum school = 
    case Map.lookup gradeNum school of 
        Just students -> students
        Nothing -> []


sorted :: School -> [(Int, [String])]
sorted school = Map.toList school
