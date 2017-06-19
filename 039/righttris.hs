import Data.List

--Takes a number, p, and generates a triangle of perimeter p, represented by
--a triple of sides (a,b,c), and a < b < c
genTriangles :: Int -> [(Int,Int,Int)]
genTriangles p = [(a,b,c) | a <- [1..p`div`2], b <- [a..p`div`2], let c = p-a-b, c > b]

--Confirms a triangle is a right triangle by the pythagorean theorem
isRight :: (Int,Int,Int) -> Bool
isRight (a,b,c) = (a^2 + b^2) == c^2

--Assuming 120 is the lower bound
answer = getPerimeter $ maximumBy compareLength $ map getRightTriangles [120..1000]
    where getRightTriangles = (filter isRight).genTriangles
          compareLength a b = length a `compare` length b
          getPerimeter ((a,b,c):xs) = a + b + c --Needed to output the perimeter, not the list of triangles