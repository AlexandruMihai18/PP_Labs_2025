square x = x * x
cube x = x * x * x

-- FUNCTII INTRO

f1 = \x y -> x + y -- echivalent cu lambda (x y) (+ x y) in Racket

f2 x y = x + y

f3 = (2 +)
f4 = (+ 2)
f5 = (- 2)
f5' = (`subtract` 2)
f6 = (2 -)

-- Obs: operatorii in Haskell sunt scrisi in forma infixata
-- 2 + 3 == (+) 2 3
-- elem 2 [1, 2, 3] == 2 `elem` [1, 2, 3]

-- TIPURI DE BAZA

-- 5 :: Int (Num -- Numeric)
-- 'H' :: Char
-- "Hello" :: String / [Char] / Char array
-- True/False :: Bool

-- LISTE - OMOGENE

-- [] -- lista vida
-- (:) -- operatorul de adaugare la inceputul liste - cons

l1 = 1 : 3 : 5 : 7 : 9 : []
l2 = [1, 3, 5, 7, 9]
l3 = [1, 3 .. 9]
l4 = [1, 3 .. 10]

-- head / tail == car / cdr
-- ++ == append

-- PERECHI - ETEROGENE

-- (3, "Ana") :: (Int, String)
-- (3, True, "Ana") :: (Int, Bool, String)

pair = (3, "Ana")

-- fst -- first element
-- snd -- second element

-- Typed Hole - Haskell permite posibilitatea determinarii tipului
-- de date al unei expresii incomplete

-- not $ fst (_, 2)

-- Vom detalia in laboratorul urmator motivul utilizarii $ in expresia de mai sus

-- DEFINIREA FUNCTIILOR

-- if - then - else
factorial_if x = if x < 1 then 1 else x * factorial_if (x - 1)

-- guards
factorial_guards x
    | x < 1 = 1
    | otherwise = x * factorial_guards (x - 1)

-- case switch
factorial_case x = case x < 1 of
    True -> 1
    _ -> x * factorial_case (x - 1) -- anything else

-- pattern matching
factorial_pattern_matching 0 = 1
factorial_pattern_matching x = x * factorial_pattern_matching (x - 1)

-- CURRY vs UNCURRY

-- Functiile in Haskell sunt curried by default
-- :t f2 -- f2 :: Num a => a -> a -> a
-- :t f2 1 -- f2 1 :: Num a => a -> a
-- :t f2 1 2 -- f2 1 2 :: Num a => a

-- Pentru a le converti in variante uncurried se foloseste functia uncurry
-- :t uncurry f2 -- uncurry f2 :: Num a => (a, a) -> a

f2_uncurry = uncurry f2

-- FUNCTII UZUALE

-- map f l1 -> l2
r1 = map (\x -> quot x 2) [2, 4 .. 20]

-- filter p l1 -> l1'
r2 = filter (\x -> mod x 2 == 1) [1, 2 .. 10]

-- foldl f acc l1 -> final -- !!! f primeste ca argumente acc si primul element al listei in aceasta ordine
r3 = foldl (\acc x -> x : acc) [] [1, 2 .. 5]

-- foldr f acc l1 -> final -- !!! f primeste ca argumente primul element al listei si acc in aceasta ordine
r4 = foldr (\x acc -> x * acc) 1 [1, 2 .. 5]

-- zip l1 l2 -> list of pairs
r5 = zip [1, 3 .. 10] [2, 4 .. 10]

-- zipWith f l1 l2 -> list of results
r6 = zipWith (\x y -> x * y) [1, 3 .. 10] [2, 4 .. 10]

-- DOMENII DE VIZIBILITATE - let / where

-- LET - letrec din Racket

pair1 = 
    let x = y + 1 -- datorita evaluarii lenese, x este evaluat la 3 in momentul utilizarii
        y = 2
        f n = if n == 0 then [] else n : f (n - 1)
    in (x + y, f 2)

-- WHERE

pair2 = (x + y, f 2)
    where
        x = y + 1
        y = 2
        f n = if n == 0 then [] else n : f (n - 1)

naturals = iter 0
    where iter x = x : iter (x + 1)
