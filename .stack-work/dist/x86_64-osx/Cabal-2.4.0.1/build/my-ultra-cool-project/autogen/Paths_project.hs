{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_project (
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
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/bin"
libdir     = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/lib/x86_64-osx-ghc-8.6.5/project-0.0.0-2zymd9qWWbsCypvTgigPnK-my-ultra-cool-project"
dynlibdir  = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/share/x86_64-osx-ghc-8.6.5/project-0.0.0"
libexecdir = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/libexec/x86_64-osx-ghc-8.6.5/project-0.0.0"
sysconfdir = "/Users/asyarusanova/Desktop/git/project/.stack-work/install/x86_64-osx/11bda5e67a2c931b7a096fb2aafcf26b08c1ed5e592cfb451c971dab9bdcf3ba/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
