--Exercise: Optional Monoid
module Monoid where


import Data.Monoid

data Optional a = Nada | Only a
               deriving (Eq, Show)
instance Semigroup (Optional a)
instance Monoid a => Monoid (Optional a) where
 mempty = Nada
 mappend (Only a) (Only b) = Only (mappend a b)
 mappend (Only a) Nada =Only( mappend  a mempty)
 mappend Nada (Only a) = Only (mappend a mempty)

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String
madlibbin' :: Exclamation -> Adverb -> Noun -> Adjective -> String
madlibbin' e adv noun adj = e
 <> "! he said " <>
 adv <> " as he jumped into his car " <>
 noun <> " and drove off with this " <>
 adj <> " wife."

madlibbinBetter' :: Exclamation-> Adverb -> Noun -> Adjective -> String
madlibbinBetter' e adv noun adj =  mconcat [e ,"! he said " ,adv," as he jumped into his car " ,noun," and drove off with this " ,adj," wife."]




--Monoid Chapter excercises

newtype BoolConj = BoolConj Bool deriving (Eq,Show)

instance Semigroup BoolConj
instance Monoid BoolConj where
    BoolConj True `mappend` mempty = BoolConj True
    BoolConj False`mappend` mempty = BoolConj False
    BoolConj True `mappend` BoolConj True = BoolConj True
    BoolConj _ `mappend` BoolConj False = BoolConj False
  






















