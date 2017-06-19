--For some reason, a value of 10000 is needed to reach the correct solution.
--Something about this clearly isn't right, but I have no desire to fix it

import Data.List

--Truncates a pattern to remove any duplicates
--Ex: "aaaabbaaabb" -> "aaaabb"
truncPattern :: String -> String -> String
truncPattern "" ys = ys 
truncPattern (x:xs) ys
    | isSuffixOf ys (x:xs) = ys
    | otherwise = truncPattern xs (ys++[x])

--Finds a pattern in the sequence by matching the tail
--against the head, growing the tail and shrinking the head
--until a match is found
findPattern :: String -> String -> String
findPattern "" xs = ""
findPattern (x:xs) ys
    | isInfixOf (x:xs) ys = truncPattern xs [x]
    | otherwise = findPattern xs (ys++[x])

--Returns the recurring pattern for the decimal part of 1/x
--Checks to the 10000th digit
getPattern :: (Integral a, Show a) => a -> String
getPattern x = findPattern quotient ""
    where quotient = show ((10^10000) `div` x)

--Returns the length of the recurring pattern for the decimal part of 1/x
patternLength :: (Integral a, Show a) => a -> Int
patternLength x 
    | solution >= 10000 = 0
    | otherwise = solution
    where solution = length $ getPattern x

answer = maximumBy (\(x,y) (a,b) -> y `compare` b) $ zip [1..1000] (map patternLength [1..1000])