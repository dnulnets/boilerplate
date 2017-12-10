module Start.Settings where

import Start.Types
import Control.Monad.State

checkSettings :: StateT Settings IO Bool
checkSettings = do
  return True
