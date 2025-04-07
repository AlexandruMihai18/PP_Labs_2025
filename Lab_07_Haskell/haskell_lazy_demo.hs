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

naturals3 = iterate (+ 1) 0

zeros = repeat 0

zerosOnes = intersperse 1 zeros -- adauga cate un 1 intre fiecare 0

fibo = 0 : 1 : zipWith (+) fibo (tail fibo)

powsOfTwo = iterate (* 2) 1

-- POINT-FREE PROGRAMMING

-- evitam utilizarea parantezelor utilizand compuneri de functii (.) si operatorul $ (delimitator)

length1 = length $ 3 : [1, 2] -- echivalent cu length1 = length (3 : [1, 2])

square x = x * x
inc x = x + 1

f1 x = inc (square x)
f2 x = inc $ square x
f3 x = inc . square $ x -- f3 x = inc . square (x)
f4 = inc . square

sum1 l1 = foldl (+) 0 l1

flip foldr [1, 2, 3] 0 (+)
foldr (+) 0 [1, 2, 3]
