{-|
Module      : DbProcessing
Description : Exercise "Database Processing" from the Haskell Book
Maintainer  : eric.zoerner@gmail.com

Exercise "Database Processing" from Chapter 10
of /Haskell Programming from First Principles/
-}
module DbProcessing
    ( DatabaseItem (..)
    , filterDbDate
    , sumDb
    , avgDb
    ) where

import Data.List (foldl')
import Data.Maybe (mapMaybe)
import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
    deriving (Eq, Ord, Show)

-- |  Write a function that filters for DbDate values
--    and returns a list
--    of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate =
  let
    getTime (DbDate t) = Just t
    getTime _ = Nothing
  in
    mapMaybe getTime

-- | Write a function that sums all of the DbNumber values.
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . nums

-- | Write a function that gets the average of the DbNumber values.

-- You'll probably need to use fromIntegral
-- to get from Integer to Double.

avgDb :: [DatabaseItem] -> Double
avgDb =
  let
    f (sumSoFar, cntSoFar) (DbNumber n) = (sumSoFar + fromInteger n, cntSoFar + 1)
    f (sumSoFar, cntSoFar) _ = (sumSoFar, cntSoFar)
    avg total count = total / count
  in
    uncurry avg . foldl' f (0,0)

nums :: [DatabaseItem] -> [Integer]
nums =
  let
    getInteger (DbNumber n) = Just n
    getInteger _ = Nothing
  in
    mapMaybe getInteger
