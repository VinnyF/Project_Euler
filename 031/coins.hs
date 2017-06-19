--Could be fit into just one line, but separated for sake of clarity
--Brute force method that takes a very long time

answer = length $ filter (\x -> x == 200) [coinsum a b c d e f g h | a <- p 1, 
                                                                     b <- p 2,
                                                                     c <- p 5,
                                                                     d <- p 10,
                                                                     e <- p 20,
                                                                     f <- p 50,
                                                                     g <- p 100,
                                                                     h <- p 200]
    where coinsum a b c d e f g h = 1*a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g + 200*h
          p x = [0..(200`div`x)]