module Main where

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' x (y:ys)
    | x /= 0 = drop' (x-1) ys
    | otherwise = y:ys

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

accumulate :: String -> String
accumulate [] = []
accumulate (x:xs)
    | '\n' == x = []
    | otherwise = x : accumulate xs

lines' :: String -> [String]
lines' [] = []
lines' (x:xs)
    | x == '\n' = lines' xs
    | otherwise = accumulate (x:xs) : lines' 
        (drop' (length' (accumulate (x:xs))) xs)

main :: IO()
main = print $ lines' "Hello\nWorld!" 
