-- any imports go here
module Party where

{-Begin Question 1.1-}
charToStr :: Char -> String
charToStr
  = (:[])

-- Ints -> Ints as [Char] (show) -> Ints as [String] (charToStr) -> [Ints] (map read to List)
digits :: Int -> [Int]
digits x
  = map (read . charToStr) (show x)

{-End Question 1.1-}

{-Begin Question 1.2-}

-- PAR: A four-digit number with different positive digits and with the numbers represented by its last two digits a multiple of the number represented by its first two digits, is called a PAR.

-- notElem: https://hackage.haskell.org/package/base-4.9.0.0/docs/Data-List.html
-- Checks for one occurrence of e recursively; if none are found -> False; if one is found -> notElem e xs
isElementUnique :: Eq a => [a] -> a -> Bool
isElementUnique [] e
  = False
isElementUnique (x:xs) e
  | (e == x) = notElem e xs
  | otherwise = isElementUnique xs e

allElementsUnique :: Eq a => [a] -> Bool
allElementsUnique []
  = True
allElementsUnique (x:xs)
  | isElementUnique (x:xs) x = allElementsUnique xs
  | otherwise = False

isPar :: Int -> Bool
isPar x
    -- 4 digits
  = (length xs == 4) &&
    -- All digits are unique
    allElementsUnique xs &&
    -- 2-digit number represented by x2 and x3 is a multiple of the 2-digit number represented by x0 and x1.
    (((10 * x2) + x3) `mod` ((10 * x0) + x1) == 0)
    where
    xs = digits x
    x0:x1:x2:x3:[] = digits x

parGenerator :: [Int]
parGenerator = [1000..9999]

pars :: [Int]
pars = filter isPar parGenerator

{-End Question 1.2-}

{-Begin Question 1.3-}

-- Returns a list of the digits of ds that aren't in xs
missingDigits :: [Int] -> [Int]
missingDigits xs
  = [d | d <- [1..9], d `notElem` xs]

-- A pair of PARs is a PARTY if no digit is repeated and each PAR is a multiple of the missing positive digit.

isParty :: (Int, Int) -> Bool
isParty (x, y)
  = -- No digit is repeated
    allElementsUnique xys &&
    -- Each PAR is a multiple of the missing positive digit
    (not moreThanOneMissingDigit) &&
    (x `mod` missingDigit == 0 && y `mod` missingDigit == 0)
    where
    xys = (digits x) ++ (digits y)
    theMissingDigits = (missingDigits xys)
    moreThanOneMissingDigit = length theMissingDigits > 1
    missingDigit:[] = if moreThanOneMissingDigit
                      then [0]
                      else theMissingDigits

partyGenerator :: [(Int, Int)]
partyGenerator
  = [(a, b) | a <- pars, b <- pars]

-- 14 partys (tick)
partys :: [(Int, Int)]
partys
  = filter isParty partyGenerator

{-End Question 1.3-}