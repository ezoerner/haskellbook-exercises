{-|
Module      : DbProcessing
Description : Exercise "Database Processing" from the Haskell Book
Maintainer  : eric.zoerner@gmail.com

Exercise "Database Processing" from Chapter 10
of /Haskell Programming from First Principles/
-}

module DbProcessing where

import Data.Time
import Data.Maybe (mapMaybe)
import Data.Monoid


data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
    deriving (Eq, Ord, Show)

-- |  Write a function that filters for DbDate values
--    and returns a list
--    of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = undefined

-- | Write a function that sums all of the DbNumber values.
-- We want to reduce some shit, get an integer
sumDb :: [DatabaseItem] -> Integer
sumDb [] = 0
sumDb (DbNumber num : xs) = num + sumDb xs
sumDb (_ : xs) = sumDb xs

-- The same, but with higher order functions, yo
sumDb' :: [DatabaseItem] -> Integer
sumDb' items = sum $ mapMaybe f items
  where f :: DatabaseItem -> Maybe Integer
        f (DbNumber x) = Just x
        f _          = Nothing


-- Monoid -- binary operation with an identity
-- Addition under positive numbers is a monoid -- 1 + 0 = 1; 1 + 1 = 2; ...
sumDb'' :: (Foldable t) => t DatabaseItem -> Integer
sumDb'' = getSum . foldMap (\x -> case x of DbNumber y -> Sum y; _ -> 0)

-- | Write a function that gets the average of the DbNumber values.

-- You'll probably need to use fromIntegral
-- to get from Integer to Double.
avgDb :: [DatabaseItem] -> Double
avgDb = undefined
