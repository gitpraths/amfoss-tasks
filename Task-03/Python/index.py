# 1. Sub Task 1
print("Hello, World!")

#2. Sub Task 2
with open('/Users/prarthanadesai/Desktop/Languages/Python/input.txt', 'r') as file1:
        content = file1.read()
with open('output.txt', 'w') as file2:
        file2.write(content)
print("Data added successfully!")

    
#3. Sub Task 3
n = int(input("Enter the rows: "))
pattern = []
for i in range(n):
    line = ""
    for j in range(i, n):
        line += "  "
    for j in range(i):
        line += "* "
    for j in range(i + 1):
        line += "* "
    pattern.append(line)
    print(line)

for i in range(n - 2, -1, -1):
    line = ""
    for j in range(i, n):
        line += "  "
    for j in range(i):
        line += "* "
    for j in range(i + 1):
        line += "* "
    pattern.append(line)
    print(line)

#4. Sub Task 4
with open('output.txt', 'a') as file2:
    file2.write("\n")
    for line in pattern:
        file2.write(line + "\n")
print("Diamond pattern written to output.txt!")
