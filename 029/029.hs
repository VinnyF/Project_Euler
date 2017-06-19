--Trivial due to Haskell's list operations
import Data.List
answer = length $ nub [a^b | a <- [2..100], b <- [2..100]]