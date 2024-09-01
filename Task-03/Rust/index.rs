use std::fs::{File, OpenOptions};
use std::io::{self, Read, Write};

fn main() {
    // Sub Task 1
    println!("Hello, World!");

    // Sub Task 2
    let mut file1 = File::open("/Users/prarthanadesai/Desktop/Languages/Python/input.txt")
        .expect("Unable to open input file");
    let mut content = String::new();
    file1.read_to_string(&mut content)
        .expect("Unable to read input file");

    let mut file2 = File::create("output.txt").expect("Unable to create output file");
    file2.write_all(content.as_bytes()).expect("Unable to write to output file");
    println!("Data added successfully!");

    // Sub Task 3
    let mut input = String::new();
    println!("Enter the rows: ");
    io::stdin().read_line(&mut input).expect("Failed to read input");
    let n: usize = input.trim().parse().expect("Invalid number");

    let mut pattern: Vec<String> = Vec::new();

    for i in 0..n {
        let mut line = String::new();
        for _ in i..n {
            line.push_str("  ");
        }
        for _ in 0..i {
            line.push_str("* ");
        }
        for _ in 0..=i {
            line.push_str("* ");
        }
        pattern.push(line.clone());
        println!("{}", line);
    }

    for i in (0..n-1).rev() {
        let mut line = String::new();
        for _ in i..n {
            line.push_str("  ");
        }
        for _ in 0..i {
            line.push_str("* ");
        }
        for _ in 0..=i {
            line.push_str("* ");
        }
        pattern.push(line.clone());
        println!("{}", line);
    }

    // Sub Task 4
    let mut file2 = OpenOptions::new()
        .append(true)
        .open("output.txt")
        .expect("Unable to open output file");
    file2.write_all(b"\n").expect("Unable to write to output file");
    for line in pattern {
        file2.write_all(line.as_bytes()).expect("Unable to write to output file");
        file2.write_all(b"\n").expect("Unable to write to output file");
    }
    println!("Diamond pattern written to output.txt!");
}
