-- |This module contains the main startup boilerplate for you to easily add
-- additional functionality and get logging right out of the box.
--
-- Written by Tomas Stenlund, Sundsvall, Sweden, 2017-12-10
-- Copyright (c) 2017, Sundsvall, Sweden.
-- See LICENSE file.
--
module Main where

--
-- Import system libraries
--
import           Control.Monad.Managed (Managed, managed, runManaged)
import           Control.Monad.State
import           System.IO

--
-- Import application libraries
--
import           Start.Game
import           Start.Settings
import           Start.Types

--
-- Import generic application base and system functionality
--
import           Base.Concurrent
import           Base.Log
import           Base.Log.FileHandle

-- |The main startup function
main:: IO()
main =  do
  putStrLn "Start Version 1.0 - Boilerplate for Haskell Applications"
  putStrLn "BSD 3-Clause License"
  putStrLn "Copyright (c) 2017, Tomas Stenlund"
  putStrLn "All rights reserved"
  putStrLn "Written by Tomas Stenlund, Sundsvall, Sweden"

  runManaged $ do
    loggerH  <- managed $ Base.Log.FileHandle.withHandle Base.Log.FileHandle.defaultConfig
    liftIO $ doit loggerH
  waitForChildren

-- |Test function to execute from the main
doit::Base.Log.Handle->IO()
doit h = do
  infoH h "Test av informationa log messages"

-- |Returns when the user presses 'q'
quit::IO ()
quit = do
  hSetBuffering stdin NoBuffering
  loop
  where
    loop = do
      c <- getChar
      if (c /= 'q')
        then loop
        else return ()
