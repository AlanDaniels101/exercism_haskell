{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_resistor_color_trio (
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
version = Version [1,0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5\\resistor-color-trio-1.0.0.0-1d4bqDc8o4U8BXnZG0kUN7-test"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\share\\x86_64-windows-ghc-8.6.5\\resistor-color-trio-1.0.0.0"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\libexec\\x86_64-windows-ghc-8.6.5\\resistor-color-trio-1.0.0.0"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\resistor-color-trio\\.stack-work\\install\\072e9945\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "resistor_color_trio_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "resistor_color_trio_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "resistor_color_trio_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "resistor_color_trio_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "resistor_color_trio_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "resistor_color_trio_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
