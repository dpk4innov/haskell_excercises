-- Addition.hs

module Addition where

import Test.Hspec
import Test.QuickCheck

--Intermission: Short Exercise
mul :: (Eq a,Num a) => a ->a ->a
mul _ 0 = 0
mul x 1 = x
mul x y = x + mul x (y-1) 





sayHello :: IO ()
sayHello = hspec $ do
           describe "multiply" $ do
             it "2 *3 is 6 " $do
              mul 2 3 `shouldBe` 6


--Chapter Excercises
il :: Integral a => a -> [a]
il 0 = []
il n = []++ [mod n 10] ++ il (div n 10)

il1 :: Integral a => a -> [a]
il1 n = reverse (il n)

itw :: (Eq a, Num a) => a -> [Char]
itw n |n==0 = "zero"
      |n==1 = "One"
      |n==2 = "two"
      |n==3 ="three"
      |n==4 ="four"
      |n==5 = "five"
      |n==6 ="six"
      |n==7 = "seven"
      |n==8 ="eight"
      |n==9 = "nine"

f1 :: (Eq a, Num a) => [a] -> [[Char]]
f1 [] =[]
f1 (x:xs) = map itw (x:xs)
con [] =[]
con (x:[])= x
con (x:xs) = x ++ "-" ++ con xs
inttoword :: Integral a => a -> [Char]
inttoword n =con (f1(il1 n))


main :: IO ()
main = hspec $ do

       describe "digitToWord does what we want" $ do
        it "returns zero for 0" $ do
         itw 0 `shouldBe` "zero"
        it "returns one for 1" $ do
         itw 1 `shouldBe` "One"
        
       describe "digits does what we want" $ do
        it "returns [1] for 1" $ do
         il1 1 `shouldBe` [1]
        it "returns [1, 0, 0] for 100" $ do
         il1 100 `shouldBe` [1,0,0]
        
       describe "wordNumber does what we want" $ do
        it "returns one-zero-zero for 100" $ do
         inttoword 100 `shouldBe` "One-zero-zero"
        it "returns nine-zero-zero-one for 9001" $ do
         inttoword 9001 `shouldBe` "nine-zero-zero-One"



half ::Double->Double
half x = x / 2
halfIdentity ::Double -> Bool
halfIdentity x = (*2)(half x) == x
runQc :: IO ()
runQc = quickCheck halfIdentity

plusAssociative ::Integer->Integer->Integer->Bool
plusCommutative ::Integer->Integer->Bool
plusAssociative x y z = x + (y + z) == (x + y) + z
plusCommutative x y = x + y == y + x
mulCommutative ::Integer->Integer->Bool
mulCommutative x y = x * y == y * x
checkrev::[Int]->Bool
checkrev [] =True
checkrev (x:xs) = reverse (reverse(x:xs)) == (x:xs)

runQc2 :: IO ()
runQc2 = do
         quickCheck plusAssociative
         quickCheck plusCommutative
         quickCheck mulCommutative
         quickCheck checkrev
           

