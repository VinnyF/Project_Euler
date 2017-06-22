module Prime (
    isPrime,
    primeSieve,
    primeFactors
) where

--Recursive part of the prime checker
isPrime' :: (Integral a) => a -> a -> Bool
isPrime' x y
    | (fromIntegral y) > sqrt (fromIntegral x) = True
    | x `mod` y == 0 = False
    | otherwise = isPrime' x (y+1)

--Wrapper for the prime checker, getting rid of numbers less than 2, and initializing the recursive part
isPrime :: (Integral a) => a -> Bool
isPrime x
    | x < 2 = False
    | otherwise = isPrime' x 2

--Takes a number, x, and returns a list of all prime numbers below it
primeSieve :: (Integral a) => a -> [a]
primeSieve x = primeSieve' x [2..x]

--Recursive part. Uses the Sieve of Eratosthenes
primeSieve' :: (Integral a) => a -> [a] -> [a]
primeSieve' _ [] = []
primeSieve' _ (x:[]) = [x]
primeSieve' y (x:xs)
    | (fromIntegral x) > sqrt (fromIntegral y) = x:xs
    | otherwise = x:(primeSieve' y $ filter (\y -> y `mod` x /= 0) xs)

--Wrapper for the following function, initializing a 2
primeFactors :: (Integral a) => a -> [a]
primeFactors x = primeFactors' x 2

--A variant on the prime checker, returning the prime factors of the given number
--Begins searching for factors from 2. The first factor found is guaranteed to be prime
--Once it is found, find the prime factors of that factor's complement
--If no factors are found before the square root of the number being checked, it itself is prime,
--And therefore its only prime factor
primeFactors' :: (Integral a) => a -> a -> [a]
primeFactors' x y
    | fromIntegral y > sqrt (fromIntegral x) = [x]
    | x `mod` y == 0 = y:primeFactors' (x `div` y) 2
    | otherwise = primeFactors' x (y+1)
