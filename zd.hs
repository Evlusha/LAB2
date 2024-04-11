isPrime :: Int -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = all (\i -> n `mod` i /= 0) [2..isqrt n]
  where isqrt = floor . sqrt . fromIntegral

main :: IO ()
main = do
  putStrLn "Введите числа (для завершения введите отрицательное число):"
  numbers <- getNumbers []
  putStrLn "Результаты проверки чисел на простоту:"
  mapM_ (\number -> if isPrime number then putStrLn (show number ++ " - простое число") else putStrLn (show number ++ " - не является простым числом")) numbers

getNumbers :: [Int] -> IO [Int]
getNumbers acc = do
  num <- readLn :: IO Int
  if num < 0
    then return (reverse acc)
    else if num > 0
      then getNumbers (num : acc)
      else do
        putStrLn "Нужно вводить только числа:"
        return []
