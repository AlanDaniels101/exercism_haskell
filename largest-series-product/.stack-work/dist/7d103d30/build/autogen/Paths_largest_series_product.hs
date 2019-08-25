{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_largest_series_product (
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

bindir     = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\bin"
libdir     = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3\\largest-series-product-1.2.0.6-FjLwq3sGHuWA5lpwW6djT7"
dynlibdir  = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\share\\x86_64-windows-ghc-8.4.3\\largest-series-product-1.2.0.6"
libexecdir = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\libexec\\x86_64-windows-ghc-8.4.3\\largest-series-product-1.2.0.6"
sysconfdir = "C:\\Users\\aland\\Exercism\\haskell\\largest-series-product\\.stack-work\\install\\dbe016db\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "largest_series_product_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "largest_series_product_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "largest_series_product_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "largest_series_product_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "largest_series_product_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "largest_series_product_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
