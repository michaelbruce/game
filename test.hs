add :: Int -> Int -> Int
add x y = x + y

twice :: (Int -> Int) -> Int -> Int
twice f x = f (f x)
