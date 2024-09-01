import System.IO

-- Sub Task 1
main :: IO ()
main = do
    putStrLn "Hello, World!"

    -- Sub Task 2
    content <- readFile "/Users/prarthanadesai/Desktop/Languages/Python/input.txt"
    writeFile "output.txt" content
    putStrLn "Data added successfully!"

    -- Sub Task 3
    putStrLn "Enter the rows: "
    input <- getLine
    let n = read input :: Int
    let pattern = createPattern n
    mapM_ putStrLn pattern

    -- Sub Task 4
    appendFile "output.txt" "\n"
    appendFile "output.txt" (unlines pattern)
    putStrLn "Diamond pattern written to output.txt!"

-- Function to create diamond pattern
createPattern :: Int -> [String]
createPattern n = top ++ bottom
  where
    top = [replicate (2 * (n - i)) ' ' ++ unwords (replicate (2 * i + 1) "*") | i <- [0..n-1]]
    bottom = reverse (init top)

