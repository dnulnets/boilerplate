module Start.Game where

import Start.Types
import Start.Settings
import Control.Monad.State
import Control.Lens

startGame :: StateT Game IO ()
startGame = do
  liftIO $ putStrLn "Starting Game"
  res <- zoom settings checkSettings
  if res 
    then liftIO $ putStrLn "Settings OK"
    else liftIO $ putStrLn "Wrong settings"
    
