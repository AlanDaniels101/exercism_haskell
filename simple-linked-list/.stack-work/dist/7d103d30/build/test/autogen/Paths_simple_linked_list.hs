{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_simple_linked_list (
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
version = Version [0,1,0,3] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\simple-linked-list-0.1.0.3-Jmsqr7gezlGGShtkSsr1TM-test"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\simple-linked-list-0.1.0.3"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\simple-linked-list-0.1.0.3"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\simple-linked-list\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "simple_linked_list_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simple_linked_list_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "simple_linked_list_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "simple_linked_list_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simple_linked_list_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "simple_linked_list_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
