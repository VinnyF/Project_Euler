import Data.Char

factorial :: (Integral a) => a -> a
factorial x
    | x == 0 = 1
    | x == 1 = 1
    | otherwise = x * factorial (x-1)

--Returns true if a number is equal to the factorial sum of its digits
isSolution :: Int -> Bool
isSolution x = x == factSum
    where factSum = sum $ map (factorial.digitToInt) (show x)

answer = sum $ filter isSolution [3..100000]