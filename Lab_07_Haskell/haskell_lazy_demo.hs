import Data.List

-- LIST COMPREHENSION

l1 = [x | x <- [0, 2 ..], x `mod` 3 == 0]

-- pentru afisare / operare cu streams se folosesc take & drop

-- LISTE INFINITE SI GENERAREA LOR CU FUNCTIONALE

naturals1 = [0..]

naturals2 = iter 0
    where iter x = x : iter (x + 1)

-- iterate -- iterate f acc -> list -- iterate aplica functia f pe acc de o infinitate
--  de ori si adauga toate elementele intermediare la lista

-- iterate f x = [x (f x) (f (f x)) ...]

naturals3 = iterate (+ 1) 0

zeros = repeat 0

zerosOnes = intersperse 1 zeros -- adauga cate un 1 intre fiecare 0

fibo = 0 : 1 : zipWith (+) fibo (tail fibo)

powsOfTwo = iterate (* 2) 1

-- POINT-FREE PROGRAMMING

-- Evitam mentionarea explicita a parametrilor unei functii
-- in definitia acesteia
-- Cod mai compact si mai usor de urmarit

length1 = length $ 3 : [1, 2] -- echivalent cu length1 = length (3 : [1, 2])

square x = x * x
inc x = x + 1

f1 x = inc (square x) -- x ** 2 + 1
f2 x = inc $ square x
f3 x = inc . square $ x -- f3 x = inc . square (x)
f4 = inc . square

sum1 l1 = foldl (+) 0 l1

sum2 :: [Integer] -> Integer
sum2 = foldl (+) 0 -- toate functiile in Haskell sunt curry

-- Compunerea functiilor: (.)

res1 = length . tail . zip [1, 2, 3, 4] $ "abc" ++ "d"

-- let f = (+ 1)
-- let g = (* 2)

-- :t f . g :: Num c => c -> c
-- :t f $ g -- eroare f asteapta un argument numeric

-- f . g $ 2
-- f . g 2
-- f $ g $ 2
-- f $ g 2

-- Functia flip 
-- flip :: (a -> b -> c) -> (b -> a -> c)
-- flip f x y = f y x

flip_map = flip map

res2 = flip_map [0..] (* 2)

myIntersperse :: a -> [a] -> [a]
myIntersperse y = foldr (++) [] . map (: [y])