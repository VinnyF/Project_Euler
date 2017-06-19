import Data.List
import Control.Applicative

--Returns a list of all the divisors of x, starting at a number y (should be 1)
divisors :: (Integral a) => a -> a -> [a]
divisors y x
    | (fromIntegral y) > sqrt (fromIntegral x) = []
    | x `mod` y == 0 = (x `div` y):y:(divisors (y+1) x)
    | otherwise = (divisors (y+1) x)

--Returns a list of all the proper divisors of x
properDivisors :: (Integral a) => a -> [a]
properDivisors x = tail (divisors 1 x)

--Takes a list of numbers, replacing each number with 0 if it is not an abundant number
makeZip :: (Integral a) => [a] -> [a]
makeZip l = getZipList $ (\x y -> if y > x then x else 0) <$> ZipList l <*> ZipList sumDivisors
    where sumDivisors = map (sum . properDivisors) l

--Returns a list of all the numbers in the range that are not abundant numbers
getNonAbundants ::(Integral a) => [a] -> [a]
getNonAbundants range = filter ((\x y -> not (y `elem` x)) abundantSum) range
    where abundantSum = nub [x+y | x <- abundants, y <- abundants]
          abundants = (removeZeros . makeZip) range
          removeZeros = filter (\x -> x /= 0)