module Particle where

data Stability = Stable | Unstable Double deriving (Show, Eq)

decayProb :: Stability -> Double
decayProb (Unstable d) = d
decayProb Stable = 0.0


data Particle = Particle {name :: String, stable :: Stability} deriving (Show, Eq)

tellParticle :: Particle -> String
tellParticle = name

tellcurrentParticles :: [Particle] -> String
tellcurrentParticles [] = ""
tellcurrentParticles (x : xs) = tellA ++ tellB
  where
  a :: [Particle]
  a = filter (== x) (x : xs)
  lenA :: Int
  lenA = length a
  tellA
    | any (/= x) xs = show lenA ++ "x " ++ tellParticle x ++ ", "
    | otherwise = show lenA ++ "x " ++ tellParticle x ++ "."
  tellB = tellcurrentParticles (filter (/= x) xs)

--unstable particles

higgsBoson :: Particle
higgsBoson = Particle {name = "Higgs Boson", stable = Unstable 0.0433}

wBoson :: Particle
wBoson = Particle {name = "W Boson", stable = Unstable 50.0000}

zBoson :: Particle
zBoson = Particle {name = "Z Boson", stable = Unstable 50.0000}

topQuark :: Particle
topQuark = Particle {name = "Top Quark", stable = Unstable 12.9500}

topAntiquark :: Particle
topAntiquark = Particle {name = "Top Antiquark", stable = Unstable 12.9500}

-- stable particles = elementary particles

bottomQuark :: Particle
bottomQuark = Particle {name = "Bottom Quark", stable = Stable}

bottomAntiquark :: Particle
bottomAntiquark = Particle {name = "Bottom Antiquark", stable = Stable}

downQuark :: Particle
downQuark = Particle {name = "Down Quark", stable = Stable}

downAntiquark :: Particle
downAntiquark = Particle {name = "Down Antiquark", stable = Stable}

upQuark :: Particle
upQuark = Particle {name = "Up Quark", stable = Stable}

upAntiquark :: Particle
upAntiquark = Particle {name = "Up Antiquark", stable = Stable}

charmQuark :: Particle
charmQuark = Particle {name = "Charm Quark", stable = Stable}

charmAntiquark :: Particle
charmAntiquark = Particle {name = "Charm Antiquark", stable = Stable}

strangeQuark :: Particle
strangeQuark = Particle {name = "Strange Quark", stable = Stable}

strangeAntiquark :: Particle
strangeAntiquark = Particle {name = "Strange Antiquark", stable = Stable}

tauLepton :: Particle
tauLepton = Particle {name = "Tau Lepton", stable = Stable}

antitauLepton :: Particle
antitauLepton = Particle {name = "Antitau Lepton", stable = Stable}

muon :: Particle
muon = Particle {name = "Muon", stable = Stable}

antimuon :: Particle
antimuon = Particle {name = "Antimuon", stable = Stable}

neutrino :: Particle
neutrino = Particle {name = "Neutrino", stable = Stable}

antineutrino :: Particle
antineutrino = Particle {name = "Antineutrino", stable = Stable}

photon :: Particle
photon = Particle {name = "Photon", stable = Stable}

gluon :: Particle
gluon = Particle {name = "Gluon", stable = Stable}

electron :: Particle
electron = Particle {name = "Electron", stable = Stable}

positron :: Particle
positron = Particle {name = "Positron", stable = Stable}
