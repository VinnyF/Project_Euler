--Returns an infinte list
fibonacci :: (Integral a) => a -> a -> [a]
fibonacci a b = a:(fibonacci b (a+b))

--Returns the index (starting at 0) of the first term to contain x digits
getIndex :: Int -> Int
getIndex x = length (takeWhile (<(10^(x-1))) $ fibonacci 1 1) + 1