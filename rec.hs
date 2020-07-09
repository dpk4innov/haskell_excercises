cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
flippy = flip cattyConny
appedCatty = cattyConny "woops"
frappe = flippy "haha"


dividedBy :: (Integral a,Eq a) => a -> a -> Maybe(a, a)
go n d count |n < d = Just(count, n)
             |otherwise = go (n - d) d (count + 1)
dividedBy num 0 = Nothing
dividedBy num denom = go num denom 0




sum1 :: (Num a,Eq a )=> a->a
sum1 0 = 0
sum1 n = n + sum1 (n-1)

mul :: (Num a,Eq a )=> a->a->a
mul a 0 = 0
mul a 1 = a
mul a b = a + mul a (b-1)

il :: (Integral a,Eq a)=>a->[a]
il 0 = []
il n = []++ [mod n 10] ++ il (div n 10)
il1 n = reverse (il n)

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

f1 (x:xs) = map itw (x:xs)
con [] =[]
con (x:xs) = x ++ "-" ++ con xs
inttoword n =con (f1(il1 n))


mc n | n>100 = n-10
     |n<=100 = mc(mc(n+11))

