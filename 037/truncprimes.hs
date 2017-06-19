import Prime

--Returns true if the string is a prime number
--and removing characters from the left keeps it
--a prime number
canTruncLeft :: String -> Bool
canTruncLeft (x:[]) = isPrime $ read [x]
canTruncLeft (x:xs)
    | (not.isPrime.read) xs = False
    | otherwise = canTruncLeft xs

--Returns true if the string is a prime number
--and removing characters from the right keeps it
--a prime number
canTruncRight :: String -> Bool
canTruncRight (x:[]) = isPrime $ read [x]
canTruncRight xs
    | (not.isPrime.read.init) xs = False
    | otherwise = canTruncRight $ init xs

--Takes a number, returning true if it is still prime when truncating left and right
isSolution :: (Integral a, Show a) => a -> Bool
isSolution x = canTruncLeft y && canTruncRight y
    where y = show x

--Don't include 2,3,5,7 in the answer
answer = sum $ filter isSolution $ dropWhile (< 10) primes
    where primes = primeSieve 1000000