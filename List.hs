module List where

import Data.Char

--Exercises: Thy Fearful Symmetry
--1
mywords []=[]
mywords (x:xs)=[]++[takeWhile (/=' ') (x:xs)] ++ mywords (dropWhile (== ' ') (dropWhile (/= ' ') (x:xs)))



--2
firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines []=[]
myLines (x:xs) = []++[takeWhile (/='\n') (x:xs)] ++ myLines(dropWhile (== '\n') (dropWhile (/= '\n') (x:xs)))
shouldEqual =
	[ "Tyger Tyger, burning bright"
	, "In the forests of the night"
	, "What immortal hand or eye"
	, "Could frame thy fearful symmetry?"
	]
main :: IO ()
main =
   print $ "Are they equal? "
           ++ show (myLines sentences == shouldEqual)


--Chapter Exercises

getUpper ::String->String
getUpper []=[]
getUpper (x:xs) = filter (isUpper) (x:xs)

firstLetterUpper ::String->String
firstLetterUpper [] =[]
firstLetterUpper (x:xs) =[toUpper x]++xs

capholler [] =[]
capholler (x:xs)= [toUpper x]++ capholler (xs)
--another way
capholler1 (x:xs)=map toUpper (x:xs) 

return1stCap (x:xs) = head (capholler (x:xs))

--myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr (x:xs)  |length (filter (==True) (x:xs)) >=1 =True
             |otherwise =False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f (x:xs) |length (filter f (x:xs)) >=1 =True
               |otherwise =False
     
myElem :: Eq a => a -> [a] -> Bool
myElem a [] =False
myElem a (x:xs) | a==x =True
                |otherwise = myElem a xs

