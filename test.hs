-- = used for equivalence
add :: Int -> Int -> Int
add x y = x + y
-- add 4 7

twice :: (Int -> Int) -> Int -> Int
twice f x = f (f x)
-- twice (add 4) 5

-- infix means 2 + 2 rather than + 2 2 - infix can be called conventionally with (+) 2 2

-- elem 3 [1,2,3,4]
-- You can use regular functions like operators with `` - e.g 3 `elem` [1,2,3,4]
-- section: intersects xs ys = any (`elem` xs) ys

-- lambdas are written like so (\<args> -> <logic>)
anon1 = twice (\x -> x * x + 10) 5

-- you can name lambdas simply - f = \x -> x * x + 10
-- like this, the \x -> x can be reduced to f = x * x + 10
f x = x * x + 10
-- e.g twice f 5

-- Creating custom data types
-- _ is a wildcard for variables we don't care about


-- data Person = Person String Int <-- original, below we're using multiple constructors
data Person = PersonWithAge String Int | PersonWithoutAge String

getName :: Person -> String
getName (Person name _) = name
getName (PersonWithoutAge name) = name

getAge :: Person -> Int
getAge (Person _ age) = age

print :: Person -> String -- auto called when data is assigned
print (Person name _) = name
