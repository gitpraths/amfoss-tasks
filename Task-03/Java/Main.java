import java.io.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Sub Task 1
        System.out.println("Hello, World!");

        // Sub Task 2
        String inputFilePath = "/Users/prarthanadesai/Desktop/Languages/Python/input.txt";
        String outputFilePath = "output.txt";

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFilePath));
             BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePath))) {

            String line;
            while ((line = reader.readLine()) != null) {
                writer.write(line);
                writer.newLine();
            }
            System.out.println("Data added successfully!");

        } catch (IOException e) {
            System.err.println("Error processing files: " + e.getMessage());
        }

        // Sub Task 3
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the rows: ");
        int n = scanner.nextInt();
        scanner.close();

        StringBuilder pattern = new StringBuilder();

        for (int i = 0; i < n; i++) {
            StringBuilder line = new StringBuilder();
            for (int j = i; j < n; j++) {
                line.append("  ");
            }
            for (int j = 0; j < i; j++) {
                line.append("* ");
            }
            for (int j = 0; j < i + 1; j++) {
                line.append("* ");
            }
            pattern.append(line.toString()).append("\n");
            System.out.println(line.toString());
        }

        for (int i = n - 2; i >= 0; i--) {
            StringBuilder line = new StringBuilder();
            for (int j = i; j < n; j++) {
                line.append("  ");
            }
            for (int j = 0; j < i; j++) {
                line.append("* ");
            }
            for (int j = 0; j < i + 1; j++) {
                line.append("* ");
            }
            pattern.append(line.toString()).append("\n");
            System.out.println(line.toString());
        }

        // Sub Task 4
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFilePath, true))) {
            writer.newLine();
            writer.write(pattern.toString());
            System.out.println("Diamond pattern written to output.txt!");
        } catch (IOException e) {
            System.err.println("Error appending to file: " + e.getMessage());
        }
    }
}
