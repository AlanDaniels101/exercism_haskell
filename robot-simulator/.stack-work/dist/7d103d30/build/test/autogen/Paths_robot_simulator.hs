{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_robot_simulator (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [3,1,0,7] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\robot-simulator-3.1.0.7-FqifPx8LZeKE1bxtOgPmyU-test"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\robot-simulator-3.1.0.7"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\robot-simulator-3.1.0.7"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\robot-simulator\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "robot_simulator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "robot_simulator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "robot_simulator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "robot_simulator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "robot_simulator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "robot_simulator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
