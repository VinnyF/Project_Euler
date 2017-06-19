import Data.Char

--Takes a number, x and returns the sum of its digits raised to the power, p
sumOfDigits :: Int -> Int -> Int
sumOfDigits p x = sum $ [a^p | a <- map digitToInt (show x)]

--Checks if a number, x, is equal to the sum of its digits raised to the power, p
isSolution :: Int -> Int -> Bool
isSolution p x = x == sumOfDigits p x

--The maximum possible number for this problem is 9*(9^x) where x is the power being raised to
answer = sum $ filter (isSolution 5) [2..9*(9^5)]