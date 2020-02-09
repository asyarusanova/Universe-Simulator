module Simulator where

import Particle
import ParticleDecay
import System.Random

type Random' a = StdGen -> (a, StdGen)

-- generate a tuple of random percentages and return a new generator
randTuple :: Random' (Double, Double)
randTuple gen = ((x,y), n_gen)
  where
  (x, n_gen) = randomR (0.0000, 100.0000) gen
  (y, _) = randomR (0.0000, 100.0000) n_gen

-- simulate the decay of a single particle
-- using the functions from ParticleDecay
decayOneParticle :: Particle -> Random' [Particle]
decayOneParticle particle g
  | stable particle == Stable = ([particle], gen)
  | rPercentage <= decayProb (stable particle) = (decayFunction particle rPercentage2, gen)
  | otherwise = ([particle], gen)
    where
    ((rPercentage, rPercentage2), gen) = randTuple g

decayFunction :: Particle -> (Double -> [Particle])
decayFunction p
  | p == higgsBoson = decayHiggsBoson
  | p == wBoson = decayWBoson
  | p == zBoson = decayZBoson
  | p == topQuark = decayTopQuark
  | otherwise = decayTopAntiquark

-- try to decay all of the particles in a list once
decayOnceList :: [Particle] -> Random' [Particle]
decayOnceList [] g = ([], g)
decayOnceList (x : xs) g = (t1 ++ t2, next2)
  where
  (t1, next1) = decayOneParticle x g
  (t2, next2) = decayOnceList xs next1

-- main simulator function
simulator :: Int -> [Particle] -> IO()
simulator n xs = if null unstableParticles then
    putStrLn (show n ++ ". " ++ tellcurrentParticles xs)
  else
    do g <- newStdGen
       putStrLn (show n ++ ". " ++ tellcurrentParticles xs)
       let (d, _) = decayOnceList xs g
       simulator (n + 1) d
       where
       unstableParticles = filter (\ p -> stable p /= Stable) xs

universeSimulator :: [Particle] -> IO()
universeSimulator = simulator 1
