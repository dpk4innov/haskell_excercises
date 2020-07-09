import Data.Time

--Exercises: Database Processing
data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)
theDatabase :: [DatabaseItem]
theDatabase =
 [ DbDate (UTCTime
 (fromGregorian 1911 5 1)
 (secondsToDiffTime 34123))
 , DbNumber 9001
 , DbString "Hello, world!"
 , DbDate (UTCTime
 (fromGregorian 1921 5 1)
 (secondsToDiffTime 34123))
 ]
my (DbDate n) = n
m1 (DbDate n) = True
m1 _ = False

my1 :: [DatabaseItem] ->[UTCTime]
my1 [] =[]
my1 (x:xs) = map my (filter m1 (x:xs))

my2 (DbNumber n) = n
m2 (DbNumber n) = True
m2 _ = False

my3 [] =0
my3 (x:xs) = sum $ map my2 (filter m2 (x:xs))

--Chapter Excercises
myOr :: [Bool] -> Bool
myOr (x:xs) = foldr (||) False (x:xs)

myAny :: (a -> Bool) -> [a] -> Bool
myAny f (x:xs) = foldr (||) False (map f (x:xs))

squish :: [[a]] -> [a]
squish (x:xs) = foldr (++) [] (x:xs)







