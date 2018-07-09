{-|
Module      : DbProcessing
Description : Exercise "Database Processing" from the Haskell Book
Maintainer  : eric.zoerner@gmail.com

Exercise "Database Processing" from Chapter 10
of /Haskell Programming from First Principles/
-}
module DbProcessing where

import Data.Time


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
sumDb :: [DatabaseItem] -> Integer
sumDb = undefined

-- | Write a function that gets the average of the DbNumber values.

-- You'll probably need to use fromIntegral
-- to get from Integer to Double.

avgDb :: [DatabaseItem] -> Double
avgDb = undefined
