import java.io.*;
import java.util.*;

public class Java {
    public static double[][] read_input(String filename) {
        try {
            Scanner sc = new Scanner(new File(filename));
            int n = sc.nextInt();
            double[][] matrix = new double[n][2 * n];
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    matrix[i][j] = sc.nextDouble();
                }
            }
            sc.close();
            return matrix;
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
            return null;
        }
    }

    public static void write_output(String filename, double[][] matrix) {
        try {
            PrintWriter writer = new PrintWriter(filename);
            writer.print(matrix.length + "\n");
            for (int i = 0; i < matrix.length; i++) {
                for (int j = 0; j < matrix[i].length; j++) {
                    writer.print(matrix[i][j] + " ");
                }
                writer.println();
            }
            writer.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
        }
    }

    public static double[][] inverse_gauss_jordan(double[][] matrix) {
        int n = matrix.length;
        double[][] augmented_matrix = new double[n][2 * n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < 2 * n; j++) {
                augmented_matrix[i][j] = (j < n) ? matrix[i][j] : (j == n + i) ? 1 : 0;
            }
        }
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
        double[][] inverse_matrix = new double[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                inverse_matrix[i][j] = augmented_matrix[i][n + j];
            }
        }
        return inverse_matrix;
    }

    public static void  main(String[] args) {
        double[][] matrix = read_input("input.txt");
        matrix = inverse_gauss_jordan(matrix);
        write_output("output/java.txt", matrix);
    }
}