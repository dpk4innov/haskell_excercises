module Adt where

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf (x:xs) [] = False
isSubsequenceOf (x:xs) (y:ys)|x:xs==(take (length(x:xs)) (y:ys))=True
				 |otherwise = isSubsequenceOf (x:xs) ys
ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n = if even n 
               then Just (n+2)
               else
               Nothing



--signaling adversity
newtype Word' = Word' String deriving (Eq, Show)
vowels = "aeiou"
cntv (x:xs) n | elem x vowels = cntv xs (n+1)
              |otherwise = cntv xs n
cntv [] n = n
mkWord :: String -> Maybe Word'
mkWord (x:xs) | ((length (x:xs))- (cntv (x:xs) 0)) < (cntv (x:xs) 0) = Nothing
              |otherwise = Just( Word' (x:xs)) 


data Nat = Zero | Succ Nat deriving (Eq, Show)
natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) =  1 + natToInteger n



isJust :: Maybe a -> Bool
isJust (Just a) = True
isJust _=False


mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b f (Just a) = f a
mayybee b f Nothing = b

get (Just a) = [a]
catMaybes :: [Maybe a] -> [a]
catMaybes (x:xs) | isJust x = get x ++ catMaybes xs
                 |(isJust x ==False )= catMaybes xs
catMaybes [] = []




myIterate :: (a -> a) -> a -> [a]
myIterate f a = [f a] ++ myIterate f (f a)






