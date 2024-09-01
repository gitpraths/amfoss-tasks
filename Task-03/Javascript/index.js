const fs = require('fs');
const readline = require('readline');

// Sub Task 1
console.log("Hello, World!");

// Sub Task 2
const inputFilePath = '/Users/prarthanadesai/Desktop/Languages/Python/input.txt';
const outputFilePath = 'output.txt';

fs.readFile(inputFilePath, 'utf8', (err, data) => {
    if (err) {
        console.error("Error reading file:", err);
        return;
    }
    
    fs.writeFile(outputFilePath, data, (err) => {
        if (err) {
            console.error("Error writing file:", err);
            return;
        }
        console.log("Data added successfully!");
    });
});

// Sub Task 3
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Enter the rows: ", (answer) => {
    const n = parseInt(answer);
    let pattern = [];
    
    for (let i = 0; i < n; i++) {
        let line = "";
        for (let j = i; j < n; j++) {
            line += "  ";
        }
        for (let j = 0; j < i; j++) {
            line += "* ";
        }
        for (let j = 0; j < i + 1; j++) {
            line += "* ";
        }
        pattern.push(line);
        console.log(line);
    }

    for (let i = n - 2; i >= 0; i--) {
        let line = "";
        for (let j = i; j < n; j++) {
            line += "  ";
        }
        for (let j = 0; j < i; j++) {
            line += "* ";
        }
        for (let j = 0; j < i + 1; j++) {
            line += "* ";
        }
        pattern.push(line);
        console.log(line);
    }

    // Sub Task 4
    fs.appendFile(outputFilePath, '\n', (err) => {
        if (err) {
            console.error("Error appending to file:", err);
            return;
        }
        pattern.forEach(line => {
            fs.appendFile(outputFilePath, line + '\n', (err) => {
                if (err) {
                    console.error("Error appending to file:", err);
                }
            });
        });
        console.log("Diamond pattern written to output.txt!");
    });

    rl.close();
});
