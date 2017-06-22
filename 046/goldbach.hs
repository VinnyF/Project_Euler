import Prime

--A a number is valid if it can be written as the sum of a prime and twice a square
--Unfortunately, has to brute force all possibilities
--Could increase running time by storing list of primes after it gets generated the first time
isValid x = isValid' x 1 $ primeSieve x
isValid' :: (Integral a) => a -> a -> [a] -> Bool
isValid' x s [] = isValid' x (s+1) $ primeSieve x 
isValid' x s (p:ps)
    | twsq > x = False
    | p + twsq == x = True
    | otherwise = isValid' x s ps
    where twsq = 2 * (s^2)

--Assuming the answer is greater than 1000
answer = head $ filter (\x -> odd x && (not.isPrime) x && (not.isValid) x) [1000..]