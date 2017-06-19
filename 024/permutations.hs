--Trivial due to the "permutations" function
import Data.List
answer = (sort . permutations) "0123456789" !! 999999