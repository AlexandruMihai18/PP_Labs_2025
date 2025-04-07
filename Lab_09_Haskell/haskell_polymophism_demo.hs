-- POLIMORFISM 

-- 1. POLIMORFISM PARAMETRIC
-- functii care permit operatii pe structuri de date generice
-- facand abstractie de tipul de date al elementelor

l1 = [1, 2, 3, 4, 5]
l2 = [1.1, 2.2, 3.3, 4.4, 5.5]

-- length functioneaza atat pentru l1 ([Int]), cat si pentru l2 ([Double])
-- length :: [a] -> Int

-- in general in antetele functiilor care au tipuri de date a, b, c
-- se considera polimorfism parametric

-- map :: (a -> b) -> [a] -> [b]


-- 2. POLIMORFISM AD HOC
-- comportament diferit pentru tipuri de date diferite

-- se bazeaza pe constrangeri de tip (extind clase!)
-- elem :: Eq a => a -> [a] -> Bool


-- CLASE IN HASKELL
-- similar cu interfetele in Java
-- tipurile de date nou create vor implementa functiile oferite de clase

data Person = Person 
    {
        name :: String,
        cnp :: Integer
    }

instance Eq Person where
    Person name1 cnp1 == Person name2 cnp2 = name1 == name2 && cnp1 == cnp2
    p1 /= p2 = not (p1 == p2)

-- Observam ca inegalitatea este definita cu ajutorul egalitatii dpdv al implementarii

data BST a = Empty | Node 
    {
        info :: a,
        l :: BST a,
        r :: BST a
    }

instance Eq a => Eq (BST a) where
    Empty == Empty = True
    Node info1 l1 r1 == Node info2 l2 r2 = info1 == info2 && l1 == l2 && r1 == r2
    _ == _ = False

    t1 /= t2 = not (t1 == t2)


-- EXTINDERE DE CLASE

-- class (Eq a) => Ord a --> Daca a este in Eq, atunci a poate fi in Ord daca defineste
-- functiile specifice clasei Ord

-- MEMBRI IMPLICITI

-- pentru clasa Eq este suficient sa implementam ==, deoarece /= este implementat
-- utilizand == automat, daca nu se doreste un alt comportament


-- CLASE PREDEFINITE

-- Ord - pentru tipuri care pot fi ordonate - definire pentru <, >, <=, etc.

-- Show - pentru tipuri care pot fi reprezentate ca String-uri - definire pentru show

-- Read - pentru tipuri care pot fi citite din String - definire pentru read?

-- Enum - pentru tipuri care pot fi enumerate - folosita implic de constructii de forma
-- [a .. b] care genereaza elemente intre 2 limite

-- Num - clasa pentru toate tipurile numerice - definire pentru +, -, *, NU IMPARTIRE

-- Integral - clasa pentru tipurile intregi - Int & Integer incluse - definire pentru mod sau div

-- Fractional - clasa pentru numere reprezentabile ca fractii - definire functia /

-- Floating - clasa pentru numere reale - definire pentru sqrt, exp, sin, cos, tan

-- Monad - tipuri care pot reprezenta actiuni monadice (operatii cu I/O)


-- DERIVING 

-- ofera instantiere standard pentru o clasa (pentru Eq asemanator cu ce am facut mai sus)


-- NUM

-- :t 5 => 5 :: Num a => a
-- 5 este o constanta polimorfica (poate sa fie Int, Double, nr complex, etc.)


-- TIPURI DE ORDIN SUPERIOR

-- Cum implementam functionale pentru tipurile noi create?

-- 1. Cream functii noi

treeMap :: (a -> b) -> BST a -> BST b

treeMap f Empty = Empty
treemap f (Node info l r) = Node (f info) (treeMap f l) (treeMap f r)

-- data Maybe a = Nothing | Just a

maybeMap :: (a -> b) -> Maybe a -> Maybe b

maybeMap f Nothing = Nothing
maybeMap f (Just x) = Just (f x)

-- 2. Instantiem clasa Functor

instance Functor BST where
    fmap f Empty = Empty
    fmap f (Node info l r) = Node (f info) (fmap f l) (fmap f r)

-- Clasa Functor poate fi definita in felul urmator

-- class Functor container where
--  fmap :: (a -> b) -> container a -> container b

-- Orice variabila de tip container trebuie aplica pe un tip de date
-- ca sa produca un tip de date valid

-- ex: BST, [], List, ( , ), etc.



