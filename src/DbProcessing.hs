module DbProcessing where

import Data.Time


data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
    deriving (Eq, Ord, Show)

--    Write a function that filters for DbDate values and returns a list
--    of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db =
  let
    f ts (DbDate t) = t : ts
    f ts _ = ts
  in
    foldl f [] db
