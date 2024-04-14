isPrime :: Int -> Bool
isPrime n
  | n < 1 = False
  | otherwise = all (\i -> n `mod` i /= 0) [2..isqrt n]
  where isqrt = floor . sqrt . fromIntegral

main :: IO ()
main = do
  putStrLn "Введите количество цифр"
  sh <- readLn
  numbers <- getNumbers sh []
  putStrLn "Результаты проверки чисел на простоту:"
  mapM_ (\number -> if isPrime number then putStrLn (show number ++ " - простое число") else putStrLn (show number ++ " - не является простым числом")) numbers

getNumbers :: Int -> [Int] -> IO [Int]
getNumbers 0 acc = return (reverse acc)
getNumbers sh acc = do
  putStrLn "Введите число:"
  num <- readLn
  if num > 0
    then getNumbers (sh - 1) (num : acc)
    else do
      putStrLn "Нужно вводить только числа:"
      return []
