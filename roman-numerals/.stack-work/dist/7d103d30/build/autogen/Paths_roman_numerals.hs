{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_roman_numerals (
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
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\roman-numerals-1.2.0.6-IamEpiX3KjpGBFgt0wXhaa"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\roman-numerals-1.2.0.6"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\roman-numerals-1.2.0.6"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\roman-numerals\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "roman_numerals_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "roman_numerals_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "roman_numerals_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "roman_numerals_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "roman_numerals_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "roman_numerals_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
