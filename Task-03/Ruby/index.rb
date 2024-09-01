# Sub Task 1
puts "Hello, World!"

# Sub Task 2
file1 = File.read('input.txt')
File.write('output.txt', file1)
puts "Data added successfully"

# Sub Task 3
puts "Enter the number of rows:"
n = gets.to_i
pattern = []

(0...n).each do |i|
  line = ""
  (i...n).each { line += "  " }
  (0...i).each { line += "* " }
  (0..i).each { line += "* " }
  pattern << line
  puts line
end

(n-2).downto(0).each do |i|
  line = ""
  (i...n).each { line += "  " }
  (0...i).each { line += "* " }
  (0..i).each { line += "* " }
  pattern << line
  puts line
end

# Sub Task 4
File.open('output.txt', 'a') do |file2|
  file2.puts "\n"
  pattern.each do |line|
    file2.puts line
  end
end
puts "Diamond pattern written to output.txt!"