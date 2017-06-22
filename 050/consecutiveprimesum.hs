import Prime
import Data.List

--This program works, but takes a very long time to compute
--faster.cpp is far better and explains the methodology

--Wrapper for consecutive sequence getter
getConsecutiveSequence :: (Integral a) => [a] -> [a]
getConsecutiveSequence pList = getConsecutiveSequence' pList []

--Keeps track of a list of primes, looking for the sum of a consecutive seqence
--which equals the last prime in the list
--Keeps track of which primes have been summed
--If the sum is greater than the prime being searched for,
--strip off the smallest prime and try again
getConsecutiveSequence' :: (Integral a) => [a] -> [a] -> [a]
getConsecutiveSequence' [] _ = []
getConsecutiveSequence' (x:[]) _ = []
getConsecutiveSequence' (x:xs) s
    | sumL > p = getConsecutiveSequence' (tail reformedPList) []
    | sumL == p = s
    | otherwise = getConsecutiveSequence' xs (x:s)
    where sumL = sum s
          p = last xs
          reformedPList = (reverse s) ++ (x:xs)

--Builds a list of lists of all possible consescutive prime numbers
--Each list needs to be reversed to keep the smallest number in front
buildPrimeList' :: (Integral a) => [a] -> [[a]]
buildPrimeList' [] = []
buildPrimeList' (x:xs) = (reverse (x:xs)):buildPrimeList' xs

--For the same reason, xs also needs to start off reversed
buildPrimeList :: (Integral a) => [a] -> [[a]]
buildPrimeList xs = buildPrimeList' $ reverse xs

--Zips the primes with a consecutive seqeuence that adds up to that number
--Outputs the one with the longest sequence
answer = maximumBy (\(a,b) (x,y) -> length b `compare` length y) $ zip (reverse primes) getSequences
    where primes = primeSieve 100000
          getSequences = map getConsecutiveSequence $ buildPrimeList primes