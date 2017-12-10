{-# LANGUAGE TemplateHaskell    #-}

module Start.Types where

import Control.Lens

-- | Informations on a particular game 
data Game = Game { _gameName :: String,
                   _settings :: Settings}
                   deriving (Show, Eq)

-- | settings
data Settings = Settings { }
                           deriving (Show, Eq)

makeLenses ''Game
makeLenses ''Settings
