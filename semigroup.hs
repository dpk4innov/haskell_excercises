module Semigroup where

import Data.Semigroup

newtype BoolConj = BoolConj Bool deriving (Show,Eq)

instance Semigroup BoolConj where
    BoolConj False <> BoolConj _ = BoolConj False
    BoolConj True <> BoolConj True = BoolConj True
    BoolConj _ <> BoolConj False = BoolConj False

newtype BoolDisj = BoolDisj Bool deriving (Show,Eq)

instance Semigroup BoolDisj where
    BoolDisj True <> BoolDisj _ = BoolDisj True
    BoolDisj False <> BoolDisj False = BoolDisj False
    BoolDisj _ <> BoolDisj True =  BoolDisj True


data Or a b = Fst a | Snd b deriving (Show,Eq)

instance Semigroup (Or a b) where
    Fst a <> x = x
    Snd b <> _ = Snd b



newtype Combine a b = Combine { unCombine :: (a -> b) }

instance Semigroup b => Semigroup (Combine a b) where
  (Combine f) <> (Combine g) = Combine (\x -> f x <> g x)



