--Assuming that all products are 4 digits long
--Also assuming that the multiplicand and multiplier are either 1 and 4 digits or 2 and 3

--Get all permutations of 123456789
--for each permutation, check if the first 5 digits mulltiply to the last 4

import Data.List

getSolution :: String -> Int
getSolution (a:b:c:d:e:f:g:h:i:[])
    | x * y == s = s
    | w * z == s = s
    | otherwise = 0
    where x = read [a]
          y = read (b:c:d:e:[])
          w = read (a:b:[])
          z = read (c:d:e:[])
          s = read (f:g:h:i:[])

--No need to filter out 0's as they do not affect the sum
answer = sum $ nub $ map getSolution $ permutations "123456789"