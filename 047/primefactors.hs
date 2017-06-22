import Prime
import Data.List

--Created and added function "primeFactors" to Prime.hs for this problem

--Takes the prime factors of a number, and returns the number of distinct factors
getDistinctPrimeFactors :: (Integral a) => a -> Int
getDistinctPrimeFactors x = (length.nub) $ primeFactors x

--Surprisingly, the most challenging part of this problem was figuring out how to
--Find a sequence of consecutive numbers within a sequence.
--Unfortunately, I had to go for this sort of hard-coded approach
--That will only find a sequence of four consecutive numbers.
findFirstConsecutive :: (Integral a) => [(a,a)] -> [(a,a)]
findFirstConsecutive ((a,b):(c,d):(w,x):[]) = []
findFirstConsecutive ((a,b):(c,d):(w,x):(y,z):xs)
    | a + 1 == c && c + 1 == w && w + 1 == y = (a,b):(c,d):(w,x):(y,z):[]
    | otherwise = findFirstConsecutive ((c,d):(w,x):(y,z):xs)

answer = findFirstConsecutive $ onlyFourFactors $ zip [1..] numOfFactors
    where numOfFactors = map getDistinctPrimeFactors [1..]
          onlyFourFactors = filter (\(a,b) -> b == 4)