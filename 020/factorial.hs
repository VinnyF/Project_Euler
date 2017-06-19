--Returns x!
factorial :: (Eq a, Num a) => a -> a
factorial x
    | x == 0 = 1
    | x == 1 = 1
    | otherwise = x * factorial (x-1)