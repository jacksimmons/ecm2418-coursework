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
generateSplit :: [Int] -> [Int] -> Int -> ([Int], [Int])
generateSplit xs ys 0
  = (xs, ys)
generateSplit [] [] n
  = ([], [])
generateSplit xs ys n
  = par final seq initial (generateSplit initial (final : ys) (n-1))
  where
  final = last xs
  initial = init xs

splits :: [Int] -> [([Int],[Int])]
splits xs
  = [generateSplit xs [] n | n <- [1..(length xs - 1)]]

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
par :: a -> b -> b
par x y = y

palindrome :: Int -> Bool
palindrome x
  = digits x == reverse (digits x)

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (xs, ys)
  =
  (firstDigitOfProd == 4) &&
  (last (digits smallest) == 3) &&
  (palindrome prod)
  where
  prod = (number xs) * (number ys)
  firstDigitOfProd = head (digits prod)
  smallest =
    -- number xs /= number ys, as the closest they can get is 4 and 5 digits respectively
    if number xs > number ys then number ys
    else number xs

acceptables :: [([Int],[Int])]
acceptables
  = filter isAcceptable possibles

{-End Question 2.3-}