import Prime
import Data.List

--Checks if the all the elements of the list are permutations of each other
--More specifically, checks if everything in the tail is a permutation of the head
arePermutations :: (Show a) => [a] -> Bool
arePermutations [] = False
arePermutations [x] = True
arePermutations (x:xs)
    | all (isPermutation x) xs = True
    | otherwise = False
    where isPermutation a b = (show b) `elem` (permutations $ show a)

--Wrapper initializing the sequence finder to 1
findSequence :: (Integral a, Show a) => a -> [a]
findSequence x = findSequence' x 1

--Finds a sequence of 3 4-digit numbers that are all prime, permutations of each other, and separated by an equal number distance
findSequence' :: (Integral a, Show a) => a -> a -> [a]
findSequence' x y
    | b > 9999 = []
    | isPrime a && isPrime b && arePermutations s = s
    | otherwise = findSequence' x (y+1)
    where a = x + y
          b = x + (y * 2)
          s = x:a:b:[]

answer = head $ filter (\x -> length x > 0) $ map findSequence relevantPrimes
    where relevantPrimes = dropWhile (<1500) $ primeSieve 9999