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
