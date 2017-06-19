--Takes a number and returns a binary string (not a number)
toBin :: (Integral a) => a -> String
toBin x
    | x == 0 = "0"
    | x == 1 = "1"
    | m == 0 = toBin (x `div` 2) ++ "0"
    | m == 1 = toBin (x `div` 2) ++ "1"
    where m = x `mod` 2

--Returns true if the number and its binary representation are both palindromes
isSolution :: (Integral a, Show a) => a -> Bool
isSolution x = (isPalindrome.show) x && (isPalindrome.toBin) x
    where isPalindrome y = y == reverse y

answer = sum $ filter isSolution [1..999999]