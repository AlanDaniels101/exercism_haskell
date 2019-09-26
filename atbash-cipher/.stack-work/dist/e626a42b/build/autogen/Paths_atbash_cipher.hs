{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_atbash_cipher (
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

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5\\atbash-cipher-1.2.0.6-Cu519mjcJM8DLqQblcMY3o"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\share\\x86_64-windows-ghc-8.6.5\\atbash-cipher-1.2.0.6"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\libexec\\x86_64-windows-ghc-8.6.5\\atbash-cipher-1.2.0.6"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\atbash-cipher\\.stack-work\\install\\072e9945\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "atbash_cipher_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "atbash_cipher_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "atbash_cipher_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "atbash_cipher_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "atbash_cipher_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "atbash_cipher_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
