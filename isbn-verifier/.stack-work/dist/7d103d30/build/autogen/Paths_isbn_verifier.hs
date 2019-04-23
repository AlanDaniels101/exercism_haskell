{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_isbn_verifier (
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
version = Version [2,7,0,9] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\isbn-verifier-2.7.0.9-DPWgsyA2TRq4rtD51REyWL"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\isbn-verifier-2.7.0.9"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\isbn-verifier-2.7.0.9"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\isbn-verifier\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "isbn_verifier_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "isbn_verifier_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "isbn_verifier_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "isbn_verifier_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "isbn_verifier_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "isbn_verifier_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
