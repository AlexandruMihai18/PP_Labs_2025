{-

	1. De cate ori este aplicata functia (^ 2) in
	cadrul evaluarii expresiei:

	head $ filter even $ map (^ 2) [1 .. 4]?

-}

{-
	2. De cate ori se calculeaza corpul functiei f la evaluarea expresiei:
	
	length [a 2, a 2, a, b, b]?
-}

f1 x y = x + y
a = f1 1
b = f1 2 3
length [] = 0
length (_:xs) = 1 + length xs

{-
	3. Cate elemente ale listei xs vor fi calculate cand
	se evalueaza expresia:

	(f2 xs)?
-}

xs = map (+ 1) [1 .. 10]
f2 (8:9:_) = True

{-
	4. Pentru programul Haskell de mai jos
	de cate ori se va evalua corpul functiei f la apelul

	g (f3 1) + h (f3 1)? 

-}

f3 x = x + 2
g x = x + f3 1 + f3 1
h x = x + x + x + x * x

{-
	5. De cate ori se evalueaza functia (+ 1)
	in cadrul expresiei:

	length $ map (+ 1) [1 .. 10]?
-}




{-
	Raspunsuri:
	1. 1
	2. 0
	3. 1
	4. 4
	5. 0
-}
