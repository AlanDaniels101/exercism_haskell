module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum)

data Robot = Robot { bearing :: Bearing
                   , coordinates :: (Integer, Integer)
                   } deriving (Show)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coord = Robot {bearing=direction, coordinates=coord }

move :: Robot -> String -> Robot
move robot [] = robot
move robot instructions = move (step robot $ head instructions) $ tail instructions

step :: Robot -> Char -> Robot
step robot 'R' = mkRobot (right (bearing robot)) (coordinates robot)
step robot 'L' = mkRobot (left(bearing robot)) (coordinates robot)
step robot 'A' = 
    let b = bearing robot
        d = case b of
            North -> (0, 1)
            East -> (1, 0)
            South -> (0, -1)
            West -> (-1, 0)
    in  mkRobot b (addTuples (coordinates robot) d)

right :: Bearing -> Bearing
right West = North
right other = succ other

left :: Bearing -> Bearing
left North = West
left other = pred other

addTuples :: (Num a) => (a, a) -> (a, a) -> (a, a)
addTuples (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)