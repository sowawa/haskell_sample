module Main ( main ) where

import Control.Concurrent
import Network.FastCGI

action :: CGI CGIResult
action = do
    setHeader "Content-type" "text/plain"
    tid <- liftIO myThreadId
    output $ unlines 
        [ "Welcome to haskell world!"
        , "Haskell on fluxflex."
        , ""
        , show tid
        ]

main :: IO ()
main = runFastCGIConcurrent' forkIO 10 action

