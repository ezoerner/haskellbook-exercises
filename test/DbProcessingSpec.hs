module DbProcessingSpec where

import Data.Time
import Test.Tasty.HUnit
import Data.List (sort)

import DbProcessing (filterDbDate, DatabaseItem(..))

{-# ANN module "HLint: ignore Use camelCase" #-}

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
                (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]


unit_filterDbDate :: IO ()
unit_filterDbDate = sort (filterDbDate theDatabase) @?=
    sort [ UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
         , UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)
         ]
