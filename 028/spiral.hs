--A quick, mathematical approach as opposed to a brute-force method
--sumOfDiagonals takes a number, n, and returns the sum of the diagonals by creating a clockwise spiral of size n x n starting at 1
--n must be a positive, odd number. No error checking has been implemented

sumOfDiagonals :: (Integral a) => a -> a
sumOfDiagonals 1 = 1
sumOfDiagonals x = a + b + c + d + sumOfDiagonals (x-2)
    where a = x*x
          b = a - x + 1
          c = b - x + 1
          d = c - x + 1

answer = sumOfDiagonals 1001