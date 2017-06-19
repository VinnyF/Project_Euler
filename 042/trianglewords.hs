import Data.Char
import Data.List

--Generates an infinite list of triangle numbers, starting from one
genTriangleNumbers = genTriangleNumbers' 1 
genTriangleNumbers' :: Int -> [Int]
genTriangleNumbers' x = y:genTriangleNumbers' (x+1)
    where y = x*(x+1) `div` 2

--Data is input as one line, with words wrapped in double quotes, separated by commas
--First splits the string into a list of strings by the commas,
--Then filters out any symbols
parseText :: String -> [String]
parseText t = map (filter isAlpha) $ groupBy (\x y -> y /= ',') t

--Converts the word into a number based on the sum of the alphabetical position of its letters
getValue :: String -> Int
getValue s = sum $ map (\x -> ord x - 64) s

--Takes in the file string and parses it,
--Converts the words to numbers,
--Then checks if the numbers are triangle numbers by checking if it is in a list of the first
--100 triangle numbers. As 10 'Z's would yield a value of 260, the first 100 numbers is more than
--sufficient to check
getAnswer :: String -> Int
getAnswer t = length $ filter isTriangleNum scores
    where isTriangleNum x = x `elem` take 100 genTriangleNumbers
          scores = map getValue $ parseText t

main = do
    text <- readFile "p042_words.txt"
    putStrLn $ show $ getAnswer text