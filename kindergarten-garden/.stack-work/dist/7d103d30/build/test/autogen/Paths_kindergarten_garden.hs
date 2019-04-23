{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_kindergarten_garden (
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
version = Version [1,1,1,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\kindergarten-garden-1.1.1.8-88Yr31UWzt78q2QfjLKnF7-test"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\kindergarten-garden-1.1.1.8"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\kindergarten-garden-1.1.1.8"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\kindergarten-garden\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "kindergarten_garden_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "kindergarten_garden_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "kindergarten_garden_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "kindergarten_garden_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "kindergarten_garden_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "kindergarten_garden_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
