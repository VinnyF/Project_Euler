import Prime

--Takes a number and returns a list of its cycles
--Ex: 1234 returns 1234, 2341, 3412, 4123
makeCycle' :: String -> String -> [String]
makeCycle' (x:[]) y = [[x]++y]
makeCycle' (x:xs) y = ((x:xs)++y):makeCycle' xs (y++[x])

makeCycle :: (Integral a, Show a) => a -> [Int]
makeCycle x = map read (makeCycle' (show x) "")

--Returns true if all of a numbers cycles are prime
isSolution :: (Integral a, Show a) => a -> Bool
isSolution x = all isPrime cycles
    where cycles = makeCycle x

--Could probably speed up operation by removing cycles that have already been attemped
answer = length $ filter isSolution primes
    where primes = primeSieve 1000000