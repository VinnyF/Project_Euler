import Data.List

--Returns true if the input string is 1-9 pandigital
isPandigital :: String -> Bool
isPandigital s = length s == 9 && "123456789" `intersect` s == "123456789"

--Wrapper for the following recursive function
isSolution :: Int -> Bool
isSolution x = isSolution' x 1 ""

isSolution' :: Int -> Int -> String -> Bool
isSolution' x y s
    | length s > 9 = False --The string is longer than 9, it can't be solution
    | length s == 9 = isPandigital s
    | otherwise = isSolution' x (y+1) (s ++ ns) --Concatinate the string for the current solution
    where ns = show $ x*y

--Identical to isSolution, except it outputs the product
--Only needed once to output the final answer
getSolution :: Int -> String
getSolution x = getSolution' x 1 ""

getSolution' :: Int -> Int -> String -> String
getSolution' x y s
    | length s > 9 = ""
    | length s == 9 = s
    | otherwise = getSolution' x (y+1) (s ++ ns)
    where ns = show $ x*y

--The upper bound cannot be more than 100k, as the concatination of 2 5-digits numbers is
--greater than 9, the required length of the string
answer = getSolution $ maximum $ filter isSolution [1..100000]