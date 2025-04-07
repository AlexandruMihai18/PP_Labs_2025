-- INTRODUCERE

-- Haskell - limbaj strong type, conversie intre tipuri se realizeaza explicit!

x :: Int
x = -1

-- y :: Double
-- y = x -- eroare de tip -- Double to Int

-- TYPE

-- similar cu typedef din C
type Point = (Int, Int)

point1 :: Point
point1 = (2, 3)

-- point2 :: Point
-- point2 = (2.0, 3.0)
-- eroare pentru ca Point este definit ca pereche de Int

-- DATA

-- data numeTip = numeConstructor arg1 arg2 .. (deriving ..)
data Point2D = Point2D Double Double deriving Show

data Point3D = Point3D Double Double Double deriving Show

-- Tipuri enumerate

-- similar cu union din C
data Colour = Red | Green | Blue | Black deriving Show

nonColour :: Colour -> Bool
nonColour Black = True
nonColour _ = False


-- Tipuri inregistrate
data PointT = PointC
    {
        px :: Double,
        py :: Double
    } deriving Show

-- Pentru selectare camp
-- px (PointC x _) = x
-- py (PointC _ y) = y

newPoint = PointC 2.0 3.0

maybeReverse1 (PointC x y) shouldReverse
    | shouldReverse = PointC y x
    | otherwise = PointC x y

-- pentru simplitate putem introduce aliasing, inlocuind Point x y cu point
-- 	in corpul functiei

maybeReverse2 point@(PointC x y) shouldReverse
    | shouldReverse = PointC y x
    | otherwise = point

-- Tipuri parametrizate

data MyMaybe a = MyJust a | MyNothing deriving (Show, Eq, Ord)

maybeHead  :: [a] -> MyMaybe a
maybeHead (x : _) = MyJust x
maybeHead _ = MyNothing

-- Tipuri recursive

data MyList a = Void | Cons a (MyList a) deriving Show

myList1 :: MyList Int
myList1 = Cons 1 $ Cons 2 $ Cons 3 Void

toList :: MyList a -> [a]
toList Void = []
toList (Cons x y) = x : toList y

data Naturals = Zero | Succ Naturals deriving Show
natural1 = Succ $ Succ $ Succ Zero

toNatural :: Naturals -> Int
toNatural Zero = 0
toNatural (Succ x) = 1 + toNatural x

-- NEWTYPE - similar cu data doar ca are un singur constructor

newtype Celsius = MakeCelsius Float deriving Show
-- newtype Celsius = MakeCelsius {getDegrees :: Float} deriving Show -- tipuri inregistrate

newtype Fahrenheit = MakeFahrenheit Float deriving Show

celsiusToFahrenheit :: Celsius -> Fahrenheit
celsiusToFahrenheit (MakeCelsius c) = MakeFahrenheit $ c * 9/5 + 32


