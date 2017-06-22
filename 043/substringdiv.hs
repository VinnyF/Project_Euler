import Data.List

--Very brute force approach
--Each string is guaranteed to be 10 digits long, so the pattern matching will always work
--Then, simply check everything that was required
isSolution :: String -> Bool
isSolution (a:b:c:d:e:f:g:h:i:j:[]) =
    t && u && v && w && x && y && z
    where t = read (b:c:d:[]) `mod` 2 == 0
          u = read (c:d:e:[]) `mod` 3 == 0
          v = read (d:e:f:[]) `mod` 5 == 0
          w = read (e:f:g:[]) `mod` 7 == 0
          x = read (f:g:h:[]) `mod` 11 == 0
          y = read (g:h:i:[]) `mod` 13 == 0
          z = read (h:i:j:[]) `mod` 17 == 0

answer = sum $ map read $ filter isSolution $ permutations "0123456789"