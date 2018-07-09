module DbProcessingSpec where

import Data.Time
import Test.Tasty.HUnit
import Data.List (sort)

import DbProcessing

{-# ANN module "HLint: ignore Use camelCase" #-}

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate time1
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate time2
    , DbNumber 792
    , DbNumber 83
    ]

diffTime :: DiffTime
diffTime = secondsToDiffTime 34123

time1 :: UTCTime
time1 = UTCTime (fromGregorian 1911 5 1) diffTime

time2 :: UTCTime
time2 = UTCTime  (fromGregorian 1921 5 1) diffTime

unit_filterDbDate :: IO ()
unit_filterDbDate = sort (filterDbDate theDatabase) @?=
    sort [time1, time2]

unit_sumDb :: IO ()
unit_sumDb = sumDb theDatabase @?= 9876

unit_avgDb :: IO ()
unit_avgDb = avgDb theDatabase @?= 3292
