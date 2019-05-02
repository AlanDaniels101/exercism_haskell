{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_sum_of_multiples (
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
version = Version [1,5,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\sum-of-multiples-1.5.0.10-A1VrQaqYrt97wr61ThVQ3K-test"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\sum-of-multiples-1.5.0.10"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\sum-of-multiples-1.5.0.10"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\sum-of-multiples\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sum_of_multiples_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sum_of_multiples_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "sum_of_multiples_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "sum_of_multiples_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sum_of_multiples_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sum_of_multiples_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)