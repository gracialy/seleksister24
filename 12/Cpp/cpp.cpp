#include <iostream>
#include <fstream>
#include <vector>

void write_output(const std::string& filename, const std::vector<std::vector<double>>& matrix, int n) {
    std::ofstream file(filename);
    if (!file) {
        std::cout << "File not found" << std::endl;
        return;
    }
    
    file << n << std::endl;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            file << matrix[i][j] << " ";
        }
        file << std::endl;
    }
    
    file.close();
}

std::vector<std::vector<double>> inverse_gauss_jordan(std::vector<std::vector<double>>& augmented_matrix, int n) {    
    std::vector<std::vector<double>> inverse_matrix(n, std::vector<double>(n, 0.0));
    
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
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            inverse_matrix[i][j] = augmented_matrix[i][n + j];
        }
    }
    
    return inverse_matrix;
}

int main() {
    // READING
    const std::string input_file = "input.txt";
    const std::string output_file = "output/cpp.txt";

    std::ifstream file(input_file);
    if (!file) {
        std::cout << "File not found" << std::endl;
        return 0;
    }
    
    int n;
    file >> n;

    // augmented matrix
    std::vector<std::vector<double>> matrix(n, std::vector<double>(2 * n, 0.0));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            file >> matrix[i][j];
        }
        for (int j = n; j < 2 * n; j++) {
            if (j == n + i) matrix[i][j] = 1;
            else matrix[i][j] = 0;
        }
    }
    
    file.close();

    // PROCESSING
    std::vector<std::vector<double>> inverse_matrix = inverse_gauss_jordan(matrix, n);

    // WRITING
    write_output(output_file, inverse_matrix, n);
        
    return 0;
}
