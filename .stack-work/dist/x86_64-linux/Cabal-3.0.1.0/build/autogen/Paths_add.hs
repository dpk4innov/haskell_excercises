{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_add (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/bin"
libdir     = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/lib/x86_64-linux-ghc-8.8.3/add-0.1.0.0-DrimPxKPNoh9BVD9tPAjsv"
dynlibdir  = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/share/x86_64-linux-ghc-8.8.3/add-0.1.0.0"
libexecdir = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/libexec/x86_64-linux-ghc-8.8.3/add-0.1.0.0"
sysconfdir = "/home/deepak/add/.stack-work/install/x86_64-linux/81c2f83452cc0b1a405479fa9249232d8f0eca927f0ba7dff100b90e9cadb23a/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "add_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "add_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "add_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "add_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "add_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "add_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
