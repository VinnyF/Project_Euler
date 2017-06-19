import Prime
import Data.List
import Data.Char

--Determines if a number contains the exactly the the digits 1 to n, where n is the length of the number
isPandigital :: Int -> Bool
isPandigital x = panString `intersect` s == panString
    where s = show x
          l = length s
          panString = ['1'..intToDigit l]

--The answer has to be less than 987654321
--For sake of speed, assuming the answer is 7 digits long
answer = last $ filter isPandigital $ primeSieve 9999999