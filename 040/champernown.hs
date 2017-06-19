import Data.Char

--Generates an infinite string representing the decimal portion of Champernowne's constant
genString :: Int -> String
genString x = (show x) ++ genString (x+1)

--Generates the string to 1000000 characters, then simply multiplies the specified indexes
answer = a * b * c * d * e * f * g
    where getDigits = take 1000000 $ genString 1
          a = digitToInt $ getDigits !! 0
          b = digitToInt $ getDigits !! 9
          c = digitToInt $ getDigits !! 99
          d = digitToInt $ getDigits !! 999
          e = digitToInt $ getDigits !! 9999
          f = digitToInt $ getDigits !! 99999
          g = digitToInt $ getDigits !! 999999