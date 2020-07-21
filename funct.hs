--Chapter excercises
module Functor where

data Sum a b = First a | Second b deriving (Eq,Show)
instance Functor (Sum e) where
 fmap _ (First a) = First a
 fmap f (Second b) = Second  (f b)

data Company a b c = DeepBlue a c| Something b deriving (Eq,Show)

instance Functor (Company e e') where
 fmap _ (Something b) = Something b
 fmap f (DeepBlue a c) = DeepBlue a (f c)

data More a b = L b a b | R a b a  deriving (Eq, Show)
instance Functor (More x) where
 fmap f (L b a b') = L (f b) a (f b')
 fmap f (R a b a') = R a (f b) a'


data EvilGoateeConst a b = GoatyConst b deriving (Eq,Show)
instance Functor (EvilGoateeConst a) where
 fmap f (GoatyConst b) = GoatyConst (f b)

data List a = Nil| Cons a (List a) deriving (Eq ,Show)
instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a b) = Cons (f a) (fmap f b)