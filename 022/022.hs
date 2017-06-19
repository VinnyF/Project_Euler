import Data.Char
import Data.List

--Separates the input string into a list of strings, delineated by non-letters
parseText :: String -> [String]
parseText list = groupBy (\x y -> isAlpha x && isAlpha y) list

--Converts a string of letters to a number based on the sum of the position of each letter in the alphabet
convertToNum :: String -> Int
convertToNum "" = 0
convertToNum s = sum $ map getNum s
    where getNum x = ord x - 64

--Returns takes the input text and converts a list of the "scores" of each name
getScores :: String -> [Int]
getScores input = zipWith (*) [1..] (map convertToNum $ sort $ removeCharacters input)
    where   removeCharacters x = removeBlanks $ (map . filter $ isAlpha) (parseText x)
            removeBlanks = filter (\x -> length x > 0)

main = do
    text <- readFile "p022_names.txt"
    putStrLn $ (show . sum . getScores) text --Displays the sum of the scores