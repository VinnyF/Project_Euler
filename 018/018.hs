--Probably really inefficient, will need reworking for problem 67 (including reading a file from input)
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq) 

generateTree :: Int -> Int -> [Int] -> Tree Int
generateTree index height list
    | list !! index == 0 = EmptyTree
    | otherwise = Node (list !! index) (generateTree (index + height + 1) (height + 1) list) (generateTree (index + height + 2) (height + 1) list)

getSums :: Tree Int -> Int -> [Int]
getSums EmptyTree sum = sum:[]
getSums (Node a left right) sum = getSums left (sum + a) ++ getSums right (sum + a)

maxPathSum :: [Int] -> Int
maxPathSum list = maximum $ getSums (generateTree 0 0 list) 0