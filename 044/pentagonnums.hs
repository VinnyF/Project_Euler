--Generates an infinite list of the pentagon numbers, starting at 1
genPentagonNumbers = genPentagonNumbers' 1
genPentagonNumbers' :: Int -> [Int]
genPentagonNumbers' x = y:genPentagonNumbers' (x+1)
    where y = x * (3 * x-1) `div` 2

--Checks if a number is a pentagonal number
--Formula is derived from the quadratic equation
--If the answer is an integer, returns True
--Note that this may run into problems due to the inaccuracy of floats
isPentagonNumber :: (Integral a) => a -> Bool
isPentagonNumber x = p == (fromInteger $ round p)
    where p = (1 + d) / 6
          d = sqrt $ fromIntegral (1 + 24*x)

--For sake of speed, assuming the answer is before the 3000th pentagon number
answer = getDiff $ [(x,y) | x <- pentas, y <- pentas, isPentagonNumber (x+y), isPentagonNumber (x-y)]
    where pentas = take 3000 genPentagonNumbers
          getDiff x = maximum $ map (\(x,y) -> abs $ x - y) x