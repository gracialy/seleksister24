#include <stdio.h>
#include <stdlib.h>

void write_output(const char* filename, double** matrix, int n) {
    FILE* file = fopen(filename, "w");
    if (file == NULL) {
        printf("File not found\n");
        return;
    }
    
    fprintf(file, "%d\n", n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            fprintf(file, "%lf ", matrix[i][j]);
        }
        fprintf(file, "\n");
    }
    
    fclose(file);
}

double** inverse_gauss_jordan(double** augmented_matrix, int n) {    
    for (int i = 0; i < n; i++) {
        double pivot = augmented_matrix[i][i];
        for (int j = 0; j < 2 * n; j++) {
            augmented_matrix[i][j] /= pivot;
        }
        for (int j = 0; j < n; j++) {
            if (i != j) {
                double factor = augmented_matrix[j][i];
                for (int k = 0; k < 2 * n; k++) {
                    augmented_matrix[j][k] -= factor * augmented_matrix[i][k];
                }
            }
        }
    }
    
    double** inverse_matrix = (double**)malloc(n * sizeof(double*));
    for (int i = 0; i < n; i++) {
        inverse_matrix[i] = (double*)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            inverse_matrix[i][j] = augmented_matrix[i][n + j];
        }
    }
    return inverse_matrix;
}

int main() {
    // READING
    const char* input_file = "../input.txt";
    const char* output_file = "../output/arm.txt";

    FILE* file = fopen(input_file, "r");
    if (file == NULL) {
        printf("File not found\n");
        return 0;
    }
    
    int n;
    fscanf(file, "%d", &n);

    // augmented matrix
    double** matrix = (double**)malloc(n * sizeof(double*)); 
    for (int i = 0; i < n; i++) {
        matrix[i] = (double*)malloc(2 * n * sizeof(double));
        for (int j = 0; j < n; j++) {
            fscanf(file, "%lf", &matrix[i][j]);
        }
        for (int j = n; j < 2 * n; j++) {
            if (j == n + i) matrix[i][j] = 1;
            else matrix[i][j] = 0;
        }
    }
    
    fclose(file);


    // PROCESSING
    double** inverse_matrix = (double**)malloc(n * sizeof(double*)); 
    for (int i = 0; i < n; i++) {
        inverse_matrix[i] = (double*)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            inverse_matrix[i][j] = 0;
        }
    }
    inverse_matrix = inverse_gauss_jordan(matrix, n);

    // WRITING
    write_output(output_file, inverse_matrix, n);
        
    for (int i = 0; i < n; i++) {
            free(matrix[i]);
            free(inverse_matrix[i]);
    }
    
    return 0;
}