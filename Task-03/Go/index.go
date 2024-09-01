package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Sub Task 1
    fmt.Println("Hello, World!")

    // Sub Task 2
    inputFilePath := "/Users/prarthanadesai/Desktop/Languages/Python/input.txt"
    outputFilePath := "output.txt"

    // Read from input file
    inputFile, err := os.Open(inputFilePath)
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    scanner := bufio.NewScanner(inputFile)
    var content strings.Builder
    for scanner.Scan() {
        content.WriteString(scanner.Text() + "\n")
    }
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading input file:", err)
        return
    }

    // Write to output file
    outputFile, err := os.Create(outputFilePath)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    _, err = outputFile.WriteString(content.String())
    if err != nil {
        fmt.Println("Error writing to output file:", err)
        return
    }
    fmt.Println("Data added successfully!")

    // Sub Task 3
    fmt.Print("Enter the rows: ")
    var n int
    _, err = fmt.Scan(&n)
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }

    var pattern strings.Builder
    for i := 0; i < n; i++ {
        line := ""
        for j := i; j < n; j++ {
            line += "  "
        }
        for j := 0; j < i; j++ {
            line += "* "
        }
        for j := 0; j < i+1; j++ {
            line += "* "
        }
        pattern.WriteString(line + "\n")
        fmt.Println(line)
    }

    for i := n - 2; i >= 0; i-- {
        line := ""
        for j := i; j < n; j++ {
            line += "  "
        }
        for j := 0; j < i; j++ {
            line += "* "
        }
        for j := 0; j < i+1; j++ {
            line += "* "
        }
        pattern.WriteString(line + "\n")
        fmt.Println(line)
    }

    // Sub Task 4
    outputFile, err = os.OpenFile(outputFilePath, os.O_APPEND|os.O_WRONLY, 0644)
    if err != nil {
        fmt.Println("Error opening output file:", err)
        return
    }
    defer outputFile.Close()

    _, err = outputFile.WriteString("\n" + pattern.String())
    if err != nil {
        fmt.Println("Error appending to output file:", err)
        return
    }
    fmt.Println("Diamond pattern written to output.txt!")
}
