-- any imports go here
module Bilateral where
import Data.List
import Party (digits)

{-Begin Question 2.1-}
number :: [Int] -> Int
number []
  = 0
number (x:xs)
  = (x * 10 ^ length xs) + number xs

{-End Question 2.1-}

{-Begin Question 2.2-}
generateSplit :: [a] -> [a] -> Int -> ([a], [a])
generateSplit xs ys 0
  = (xs, ys)
generateSplit [] [] n
  = ([], [])
generateSplit xs ys n
  = (generateSplit initial (final : ys) (n-1))
  where
  final = last xs
  initial = init xs

-- Generates splits with list comprehension
-- Note: reverse is used so the output matches the specification
splits :: [a] -> [([a],[a])]
splits xs
  = [generateSplit xs [] n | n <- reverse [1..(length xs - 1)]]

mergeListOfLists :: [[a]] -> [a] -> [a]
mergeListOfLists [] ys
  = ys
mergeListOfLists (xs:xss) ys
  = mergeListOfLists xss (ys ++ xs)

possibles :: [([Int],[Int])]
possibles
  = [(a,b) | p <- permutations [1, 2, 3, 4, 5, 6, 7, 8, 9], (a,b) <- splits p]

numPossibles :: Int
numPossibles = length possibles

{-End Question 2.2-}

{-Begin Question 2.3-}
palindrome :: Int -> Bool
palindrome x
  =
  listX == reverse listX
  where listX = digits x

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (xs, ys)
  =
  (firstDigitOfProd == 4) &&
  (smallest `mod` 10 == 3) &&
  (palindrome prod)
  where
  prod = (number xs) * (number ys)
  firstDigitOfProd = head (digits prod)
  smallest =
    -- number xs /= number ys, as the closest they can get is 4 and 5 digits respectively
    if number xs > number ys then number ys
    else number xs

-- 6 sols (tick)
-- Slow function, can take 3 minutes
acceptables :: [([Int],[Int])]
acceptables
  = filter isAcceptable possibles

{-End Question 2.3-}

-- Checks:
-- Function types (tick)
-- Testing output (tick)

-- Testing:
main :: IO ()
main
  = -- Basic output
    print (number [9,1,2,4]) >>
    print (splits [1,2,3,4]) >>
    print (isAcceptable ([7,1,6,3], [5,9,2,4,8])) >>
    print (acceptables)