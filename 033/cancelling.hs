--Takes a tuple (x,y) and returns True if it can be reduced by cancelling like digits
canCancel :: (Integral a) => (a,a) -> Bool
canCancel (x,y)
    | n1 == 0 && d1 == 0 = False
    | n0 == d0 && (realToFrac n1) / (realToFrac d1) == s = True
    | n1 == d0 && (realToFrac n0) / (realToFrac d1) == s = True
    | n0 == d1 && (realToFrac n1) / (realToFrac d0) == s = True
    | n1 == d1 && (realToFrac n0) / (realToFrac d0) == s = True
    | otherwise = False
    where n0 = x `div` 10
          n1 = x `mod` 10
          d0 = y `div` 10
          d1 = y `mod` 10
          s = (realToFrac x) / (realToFrac y)

answer = snd $ reduce $ mult $ filter canCancel [(x,y) | x <- [11..99], y <- [x+1..99]]
    where mult = foldl (\(x,y) (a,b) -> (x*a,y*b)) (1,1) --Multiplies the numerators and denominators of the fractions
          reduce (x,y) = (x `div` gcd x y,y `div` gcd x y) --Reduces the fraction