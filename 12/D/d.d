import std.stdio;
import std.array;
import std.algorithm;
import std.conv;
import std.file;
import std.string;
import std.math;

void write_output(const string filename, double[][] matrix, int n) {
    auto file = File(filename, "w");
    if (!file.isOpen) {
        writeln("File not found");
        return;
    }
    
    file.writeln(n);
    foreach (i; 0 .. n) {
        foreach (j; 0 .. n) {
            file.writef("%.8f ", matrix[i][j]);
        }
        file.writeln();
    }
    
    file.close();
}

double[][] inverse_gauss_jordan(double[][] matrix, int n) {
    double[][] inverse = new double[][](n);
    foreach (i; 0 .. n) {
        inverse[i] = new double[](n);
        for (int j = 0; j < n; j++) {
            inverse[i][j] = i == j ? 1 : 0;
        }
    }

    for (int i = 0; i < n; i++) {
        double pivot = matrix[i][i];
        foreach (j; 0 .. n) {
            matrix[i][j] /= pivot;
            inverse[i][j] /= pivot;
        }

        foreach (k; 0 .. n) {
            if (k == i) {
                continue;
            }

            double factor = matrix[k][i];
            foreach (j; 0 .. n) {
                matrix[k][j] -= factor * matrix[i][j];
                inverse[k][j] -= factor * inverse[i][j];
            }
        }
    }

    return inverse;
}

void print_matrix(double[][] matrix, int n) {
    foreach (i; 0 .. n) {
        foreach (j; 0 .. n) {
            write(matrix[i][j], " ");
        }
        writeln();
    }
}

void main() {
    // READING
    const string input_file = "input.txt";
    const string output_file = "output/d.txt";

    // READING
    auto lines = readText(input_file).splitLines();
    
    int n;
    n = to!int(lines[0]);

    double[][] matrix = new double[][](n);
    foreach (i; 0 .. n) {
        matrix[i] = lines[i + 1].split.map!(a => a.to!double).array;
    }    

    // PROCESSING
    double[][] inverse = inverse_gauss_jordan(matrix, n);

    // WRITING
    write_output(output_file, inverse, n);

}
