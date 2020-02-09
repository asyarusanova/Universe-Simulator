module Main where

import Particle
import ParticleDecay
import Simulator

getStartingParticles :: IO [Particle]
getStartingParticles =
  do
    putStrLn "Enter Particle: "
    p <- getLine
    case stringToParticle p of
      Nothing -> return []
      Just p1 -> do
        p2 <- getStartingParticles
        return (p1 : p2)

-- convert the input into a particle
stringToParticle :: String -> Maybe Particle
stringToParticle "Higgs Boson" = Just higgsBoson
stringToParticle "W Boson" = Just wBoson
stringToParticle "Z Boson" = Just zBoson
stringToParticle "Top Quark" = Just topQuark
stringToParticle "Top Antiquark" = Just topAntiquark
stringToParticle "Bottom Quark" = Just bottomQuark
stringToParticle "Bottom Antiquark" = Just bottomAntiquark
stringToParticle "Down Quark" = Just downQuark
stringToParticle "Down Antiquark" = Just downAntiquark
stringToParticle "Up Quark" = Just upQuark
stringToParticle "Up Antiquark" = Just upAntiquark
stringToParticle "Charm Quark" = Just charmQuark
stringToParticle "Charm Antiquark" = Just charmAntiquark
stringToParticle "Strange Quark" = Just strangeQuark
stringToParticle "Strange Antiquark" = Just strangeAntiquark
stringToParticle "Tau Lepton" = Just tauLepton
stringToParticle "Antitau Lepton" = Just antitauLepton
stringToParticle "Muon" = Just muon
stringToParticle "Antimuon" = Just antimuon
stringToParticle "Neutrino" = Just neutrino
stringToParticle "Antineutrino" = Just antineutrino
stringToParticle "Photon" = Just photon
stringToParticle "Gluon" = Just gluon
stringToParticle "Electron" = Just electron
stringToParticle "Positron" = Just positron
stringToParticle _ = Nothing


main :: IO ()
main = do
  plist <- getStartingParticles
  universeSimulator plist
