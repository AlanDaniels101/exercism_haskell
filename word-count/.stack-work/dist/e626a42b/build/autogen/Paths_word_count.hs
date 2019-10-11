{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_word_count (
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
version = Version [1,4,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5\\word-count-1.4.0.8-4hdWMQILt19KJoL1oqYF1v"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\share\\x86_64-windows-ghc-8.6.5\\word-count-1.4.0.8"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\libexec\\x86_64-windows-ghc-8.6.5\\word-count-1.4.0.8"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\word-count\\.stack-work\\install\\072e9945\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "word_count_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "word_count_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "word_count_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "word_count_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "word_count_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "word_count_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
