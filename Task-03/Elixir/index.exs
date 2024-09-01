# 1. Sub Task 1
IO.puts "Hello, World!"

# 2. Sub Task 2
content = File.read!("input.txt")
File.write!("output.txt", content)
IO.puts "Data added successfully!"

# 3. Sub Task 3
n = IO.gets("Enter the rows: ") |> String.trim() |> String.to_integer()
pattern = 
  for i <- 0..(n-1) do
    line = 
      String.duplicate("  ", n - i) <> 
      String.duplicate("* ", i) <> 
      String.duplicate("* ", i + 1)
    IO.puts line
    line
  end ++ 
  for i <- (n-2)..0 do
    line = 
      String.duplicate("  ", n - i) <> 
      String.duplicate("* ", i) <> 
      String.duplicate("* ", i + 1)
    IO.puts line
    line
  end

# 4. Sub Task 4
File.write!("output.txt", "\n", [:append])
File.write!("output.txt", Enum.join(pattern, "\n") <> "\n", [:append])
IO.puts "Diamond pattern written to output.txt!"
