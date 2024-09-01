#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void write_to_file(const char *filename, const char *content, int append) {
    FILE *file = fopen(filename, append ? "a" : "w");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s", content);
    fclose(file);
}

int main() {
    // Sub Task 1
    printf("Hello, World!\n");

    // Sub Task 2
    FILE *file1 = fopen("/Users/prarthanadesai/Desktop/Languages/Python/input.txt", "r");
    if (file1 == NULL) {
        perror("Error opening input file");
        return EXIT_FAILURE;
    }

    char content[1024];
    size_t len = fread(content, 1, sizeof(content) - 1, file1);
    if (len == 0) {
        perror("Error reading input file");
        fclose(file1);
        return EXIT_FAILURE;
    }
    content[len] = '\0';

    fclose(file1);

    write_to_file("output.txt", content, 0);
    printf("Data added successfully!\n");

    // Sub Task 3
    int n;
    printf("Enter the rows: ");
    scanf("%d", &n);

    char pattern[1024] = "";
    for (int i = 0; i < n; i++) {
        char line[1024] = "";
        for (int j = i; j < n; j++) {
            strcat(line, "  ");
        }
        for (int j = 0; j < i; j++) {
            strcat(line, "* ");
        }
        for (int j = 0; j < i + 1; j++) {
            strcat(line, "* ");
        }
        strcat(pattern, line);
        strcat(pattern, "\n");
        printf("%s\n", line);
    }

    for (int i = n - 2; i >= 0; i--) {
        char line[1024] = "";
        for (int j = i; j < n; j++) {
            strcat(line, "  ");
        }
        for (int j = 0; j < i; j++) {
            strcat(line, "* ");
        }
        for (int j = 0; j < i + 1; j++) {
            strcat(line, "* ");
        }
        strcat(pattern, line);
        strcat(pattern, "\n");
        printf("%s\n", line);
    }

    // Sub Task 4
    write_to_file("output.txt", "\n", 1);
    write_to_file("output.txt", pattern, 1);
    printf("Diamond pattern written to output.txt!\n");

    return 0;
}
