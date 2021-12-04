{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_AOC2021 (
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

bindir     = "/home/gitpod/.cabal/bin"
libdir     = "/home/gitpod/.cabal/lib/x86_64-linux-ghc-8.6.5/AOC2021-0.1.0.0-HD2Zr5NYVBk3aAEscZzEO0-AOC2021"
dynlibdir  = "/home/gitpod/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/gitpod/.cabal/share/x86_64-linux-ghc-8.6.5/AOC2021-0.1.0.0"
libexecdir = "/home/gitpod/.cabal/libexec/x86_64-linux-ghc-8.6.5/AOC2021-0.1.0.0"
sysconfdir = "/home/gitpod/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "AOC2021_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "AOC2021_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "AOC2021_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "AOC2021_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "AOC2021_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "AOC2021_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
