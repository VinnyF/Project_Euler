--The method for solving this is mostly taken from problems 42 and 44

--Generates an infinite list of triangle numbers, starting from one
genTriangleNumbers = genTriangleNumbers' 1 
genTriangleNumbers' :: Int -> [Int]
genTriangleNumbers' x = y:genTriangleNumbers' (x+1)
    where y = x*(x+1) `div` 2

--Checks if a number is a pentagonal number
--Formula is derived from the quadratic equation
--If the answer is an integer, returns True
--Note that this may run into problems due to the inaccuracy of floats
isPentagonNumber :: (Integral a) => a -> Bool
isPentagonNumber x = p == (fromInteger $ round p)
    where p = (1 + d) / 6
          d = sqrt $ fromIntegral (1 + 24*x)

--Checks if a number is a hexagonal number
--Same notes as previous checker
isHexagonNumber :: (Integral a) => a -> Bool
isHexagonNumber x = p == (fromInteger $ round p)
    where p = (1 + d) / 4
          d = sqrt $ fromIntegral (1 + 8*x)

--Drop 285, as the problem asks for the second solution in the sequence
answer = head $ filter (\x -> isPentagonNumber x && isHexagonNumber x) $ drop 285 genTriangleNumbers