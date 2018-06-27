module DbProcessingSpec where

import Data.Time
import qualified Data.Set as Set
import Test.Tasty.HUnit

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
unit_filterDbDate = Set.fromList (filterDbDate theDatabase) @?=
    Set.fromList
        [ UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)
        , UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)
        ]
