#include <iostream>
#include <fstream>
#include <vector>
#include <string>

int main() {
    // Sub Task 1
    std::cout << "Hello, World!" << std::endl;

    // Sub Task 2
    std::ifstream file1("/Users/prarthanadesai/Desktop/Languages/Python/input.txt");
    std::ofstream file2("output.txt");

    if (file1.is_open() && file2.is_open()) {
        std::string content((std::istreambuf_iterator<char>(file1)), std::istreambuf_iterator<char>());
        file2 << content;
        std::cout << "Data added successfully!" << std::endl;
    }

    file1.close();
    file2.close();

    // Sub Task 3
    int n;
    std::cout << "Enter the rows: ";
    std::cin >> n;

    std::vector<std::string> pattern;

    for (int i = 0; i < n; i++) {
        std::string line = "";
        for (int j = i; j < n; j++) {
            line += "  ";
        }
        for (int j = 0; j < i; j++) {
            line += "* ";
        }
        for (int j = 0; j <= i; j++) {
            line += "* ";
        }
        pattern.push_back(line);
        std::cout << line << std::endl;
    }

    for (int i = n - 2; i >= 0; i--) {
        std::string line = "";
        for (int j = i; j < n; j++) {
            line += "  ";
        }
        for (int j = 0; j < i; j++) {
            line += "* ";
        }
        for (int j = 0; j <= i; j++) {
            line += "* ";
        }
        pattern.push_back(line);
        std::cout << line << std::endl;
    }

    // Sub Task 4
    std::ofstream file3("output.txt", std::ios::app);
    if (file3.is_open()) {
        file3 << "\n";
        for (const std::string& line : pattern) {
            file3 << line << "\n";
        }
        std::cout << "Diamond pattern written to output.txt!" << std::endl;
    }

    file3.close();

    return 0;
}
