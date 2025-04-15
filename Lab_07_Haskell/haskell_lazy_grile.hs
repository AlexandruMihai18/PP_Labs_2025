{-
	1. Care dintre urmatoarele functii este echivalenta
	cu functia Haskell
		sum . map (* 2) ?
	
	(a) (* 2) . sum
	(b) (* 2) . map sum
	(c) map (* 2) . sum
	(d) map sum . (* 2)
-}

{-
	2. Care este tipul sintetizat de Haskell pentru functia f2?
	
	** (.) :: (b -> c) -> (a -> b) -> a -> c

-}

f2 x y z = x y . z

{-
	3. Care este tipul liste Haskell [foldl, foldr]?
	** Hint: listele sunt omogene
	** Hint: tip foldl, foldr?
-}

-- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

{-
	4. Care este tipul urmatoarei expresii in Haskell [map, filter]?
-}

-- map :: (a -> b) -> [a] -> [a]
-- filter :: (a -> Bool) -> [a] -> [a]

{-
	5. Care este tipul urmatoarei expresii in Haskell?
		iterate (\x -> (+ (x 2))) (+ 1)
-}

ex5 = iterate (\x -> (+ (x 2))) (+ 1)

-- iterate :: (a -> a) -> a -> [a]

{-
	6. Care este tipul urmatoarei expresii in Haskell?
		f6
-}

f6 x y z = filter z . y $ x

{-
	Raspunsuri:
	1. (a)
	2. f2 :: (t -> b -> c) -> t -> (a -> b) -> a -> c
	3. [foldl, foldr] :: Foldable t => [(b -> b -> b) -> b -> t b -> b]
	4. [map, filter] :: [(Bool -> Bool) -> [Bool] -> [Bool]]
	5. [Integer -> Integer]
	6. f6 :: a1 -> (a1 -> [a2]) -> (a2 -> Bool) -> [a2]
-}
