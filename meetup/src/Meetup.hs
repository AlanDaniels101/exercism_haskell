module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate
import Data.List

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday
             deriving (Enum, Eq, Read, Show, Bounded)

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month =
    let f = firstWeekday weekday (firstDay year month) 
        d = scheduleWeekday schedule f (gregorianMonthLength year month)
    in
        fromGregorian year month d

firstDay :: Integer -> Int -> Int
firstDay year month = (snd $ mondayStartWeek $ fromGregorian year month 1) - 1

firstWeekday :: Weekday -> Int -> Int
firstWeekday day firstDayOfMonth =
    let deltaDays = (fromEnum day) - firstDayOfMonth in
        (deltaDays `mod` 7) + 1

scheduleWeekday :: Schedule -> Int -> Int -> Int
scheduleWeekday First firstWeekday _ = firstWeekday
scheduleWeekday Second firstWeekday _ = firstWeekday + 7
scheduleWeekday Third firstWeekday _ = firstWeekday + 14
scheduleWeekday Fourth firstWeekday _ = firstWeekday + 21
scheduleWeekday Last firstWeekday monthLength = 
    if (firstWeekday + 28 <= monthLength) 
        then firstWeekday + 28
        else firstWeekday + 21
scheduleWeekday Teenth firstWeekday _ = maybe 0 id (find (>=13) (map (\x -> x * 7 + firstWeekday) [0..]))