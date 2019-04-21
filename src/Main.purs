module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Effect.Console as Console
import Graphics.Canvas (Context2D, getCanvasElementById, getContext2D)
import Graphics.Drawing (render)
import Grid (nextState)
import Grid.Internal (randomGrid, Grid)
import Grid.Render (drawUpdate, redrawGrid)

main :: Effect Unit
main = do
  mCanvas <- getCanvasElementById "canvas"
  case mCanvas of
    Nothing -> Console.log ("canvas not found.")
    Just canvas -> do
      ctx <- getContext2D canvas
      render ctx $ redrawGrid randomGrid
      gridLoop ctx randomGrid

gridLoop :: Context2D -> Grid -> Effect Unit
gridLoop ctx grid = do
  render ctx $ drawUpdate $ fst nextTuple
  gridLoop ctx $ snd nextTuple where
    nextTuple = nextState grid
