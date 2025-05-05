{-
	1. Care dntre urmatoarele definitii va genera eroare,
	porning de la tipul de date Haskell de mai jos?

	data MyType = A Float Float | B Bool

	(a) f (A x) (B b) = True
	(b) f = (A, B, A 1.0)
	(c) f (A _ _) (B _) = False
	(d) f = [A (12 + 4) 5, B True]
-}

{-
	2. Care ar fi antetul corect pentru a instantia clasa Functor?

	class Functor f where
		fmap :: (a -> b) -> f a -> f b

	data Either c d = Left c | Right d

	(a) instance Functor (Either c d) where
	(b) instance Functor (Either c) where
	(c) instance Functor Either where
	(d) Nu se poate instantia clasa
-}

{-
	3. Cunoscand in Haskell:
	
	null :: Foldable t => t a -> Bool
	takeWhile :: (a -> Bool) -> [a] -> [a]

	ce fel de polimorfism are functia f?

	f x l = null (takeWhile x l)

	(a) Doar parametric
	(b) Doar ad-hoc
	(c) Atat parametric, cat si ad-hoc
	(d) Functia nu este polimorfica
-}

{-
	4. Pentru programul Haskell de mai jos, ce tip va avea expresia [x, y]?

	data MyData a b
		= A a (MyData a b)
		| B b (MyData a b)
		| C a b

	x = A id
	y = B "id"?
-}

{-
	5. Pentru definitiile Haskell:

	data MyT = Cons1 Int | Cons2 Int | Cons3 Int Float
	f cons arg = zipWith (\c a -> c a) cons arg

	care dintre urmatoarele legari NU genereaza o eroare?

	a) let x = f [Cons1, Cons2]
	b) let x = f [Cons1, Cons3 1]
	c) let x = f [Cons2, Cons3 2]
-}

{-
	6. Functia fmap din Haskell are tipul:

	Functor f => (a -> b) -> f a -> f b

	Acest lucru inseamna ca:

	- fmap este / nu este polimorfica ad-hoc (variabile?)
	- fmap este / nu este polimorfica parametric (variabile?)
-}

{-
	7. Care varianta de definire a functiei null din Haskell
	este mai potrivita si de ce?
-}

null1 [] = True
null1 _ = False

null2 l = l == []

{-
	Raspunsuri:
	1) a
	2) b
	3) a
	4) [MyData (a -> a) [Char] -> MyData (a -> a) [Char]]
	5) a
	6) Ad-hoc in f, parametric in a si b
	7) Varianta 1
-}