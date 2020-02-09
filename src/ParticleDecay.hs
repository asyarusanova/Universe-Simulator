module ParticleDecay where

import Particle

decayHiggsBoson :: Double -> [Particle]
decayHiggsBoson decayProbability
  | decayProbability <= 64.8000 = [bottomQuark, bottomAntiquark]
  | decayProbability > 64.8000 && decayProbability <= 78.9000 = [wBoson, wBoson]
  | decayProbability > 78.9000 && decayProbability <= 87.7200 = [gluon, gluon]
  | decayProbability > 87.7200 && decayProbability <= 94.7600 = [tauLepton, antitauLepton]
  | decayProbability > 94.7600 && decayProbability <= 98.0300 = [charmQuark, charmAntiquark]
  | decayProbability > 98.0300 && decayProbability <= 99.6200 = [zBoson, zBoson]
  | decayProbability > 99.6200 && decayProbability <= 99.8430 = [photon, photon]
  | decayProbability > 99.8430 && decayProbability <= 99.9540 = [zBoson, photon]
  | decayProbability > 99.9540 && decayProbability <= 99.9784 = [muon, antimuon]
  | otherwise = [topQuark, topAntiquark]

decayWBoson :: Double -> [Particle]
decayWBoson decayProbability
  | decayProbability <= 33.3333 = [positron, neutrino]
  | decayProbability > 33.3333 && decayProbability <= 66.6667 = [antimuon, neutrino]
  | otherwise = [antitauLepton, neutrino]

decayZBoson :: Double -> [Particle]
decayZBoson decayProbability
  | decayProbability <= 20.6000 = [neutrino, antineutrino]
  | decayProbability > 20.6000 && decayProbability <= 24.0000 = [electron, positron]
  | decayProbability > 24.0000 && decayProbability <= 27.4000 = [muon, antimuon]
  | decayProbability > 27.4000 && decayProbability <= 30.8000 = [tauLepton, antitauLepton]
  | decayProbability > 30.8000 && decayProbability <= 46.0000 = [downQuark, downAntiquark]
  | decayProbability > 46.0000 && decayProbability <= 61.2000 = [strangeQuark, strangeAntiquark]
  | decayProbability > 61.2000 && decayProbability <= 76.4000 = [bottomQuark, bottomAntiquark]
  | decayProbability > 76.4000 && decayProbability <= 88.2000 = [upQuark, upAntiquark]
  | otherwise = [charmQuark, charmAntiquark]

decayTopQuark :: Double -> [Particle]
decayTopQuark decayProbability
  | decayProbability <= 33.3333 = [wBoson, downQuark]
  | decayProbability > 33.3333 && decayProbability <= 66.6667 = [wBoson, strangeQuark]
  | otherwise = [wBoson, bottomQuark]

decayTopAntiquark :: Double -> [Particle]
decayTopAntiquark decayProbability
  | decayProbability <= 33.3333 = [wBoson, downAntiquark]
  | decayProbability > 33.3333 && decayProbability <= 66.6667 = [wBoson, strangeAntiquark]
  | otherwise = [wBoson, bottomAntiquark]
