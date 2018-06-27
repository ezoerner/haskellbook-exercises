module DbProcessingSpec where

import Data.Time
import Test.Tasty.HUnit

import DbProcessing (filterDbDate, DatabaseItem(..))

{-# ANN module "HLint: Use camelCase" #-}

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
unit_filterDbDate = filterDbDate theDatabase @?=
    [ UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
    , UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)
    ]
