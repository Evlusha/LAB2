import Data.List
import Data.HashSet (HashSet)
import qualified Data.HashSet as HashSet

main :: IO ()
main = do
  let text = ["_._ ..", "_._ ..", "=", "2"]
  let uniqueTextCount = repac text 4
  putStrLn $ "Количество уникальных слов на азбуке Морзе: " ++ show uniqueTextCount

repac :: [String] -> Int -> Int
repac text size = HashSet.size $ foldl' (\uniqueText word -> HashSet.insert (sort word) uniqueText) HashSet.empty text
