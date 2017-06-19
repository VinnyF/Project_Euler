import Data.List

--Takes a number, x, and returns a list of its proper divisors
--y should be initialized to 1
--Not very efficient
properDivisors :: (Integral a) => a -> a -> [a]
properDivisors y x
    | x == y = []
    | x `mod` y == 0 = y:(properDivisors (y+1) x)
    | otherwise = (properDivisors (y+1) x)

--Generates a list of tuples of a number and the sum of its proper divisors
buildTuple :: (Integral a) => [a] -> [(a,a)]
buildTuple input = zip sumDivisors input
    where sumDivisors = map sum (map (properDivisors 1) input)

--Returns a list of amicable numbers
--Where an amicable number is number, n, whos sum of proper divisors has a sum of proper divisors equal to n
amicableNumbers :: (Integral a) => [(a,a)] -> [a]
amicableNumbers (_:[]) = []
amicableNumbers ((x,y):xs) = if (y,x) `elem` xs then x:y:(amicableNumbers xs) else amicableNumbers xs

--Takes in a range of numbers and returns a list of amicable numbers with duplicates removed
getAmicableNumbers :: (Integral a) => [a] -> [a]
getAmicableNumbers input = nub $ amicableNumbers $ buildTuple input