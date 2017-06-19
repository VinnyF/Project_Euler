module Prime (
    isPrime,
    primeSieve
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