using System;
using System.IO;

public class Program
{
    static void PrintMatrix(float[,] matrix)
    {
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                Console.Write(matrix[i, j] + " ");
            }
            Console.WriteLine();
        }
        return;
    }

    static float[,] readInput(string filename) {
        string[] lines = File.ReadAllLines(filename);
        int n = lines.Length - 1;
        float[,] matrix = new float[n, n];
        for (int i = 1; i <= n; i++)
        {
            string[] line = lines[i].Split(' ');
            for (int j = 0; j < n; j++)
            {
                matrix[i-1, j] = float.Parse(line[j]);
            }
        }
        return matrix;
    }

    static float[,] inverseGaussJordan(float[,] matrix)
    {
        int n = matrix.GetLength(0);
        float[,] inverse = new float[n, n];
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                inverse[i, j] = (i == j) ? 1 : 0;
            }
        }
        for (int i = 0; i < n; i++)
        {
            float pivot = matrix[i, i];
            for (int j = 0; j < n; j++)
            {
                matrix[i, j] /= pivot;
                inverse[i, j] /= pivot;
            }
            for (int j = 0; j < n; j++)
            {
                if (j == i) continue;
                float factor = matrix[j, i];
                for (int k = 0; k < n; k++)
                {
                    matrix[j, k] -= factor * matrix[i, k];
                    inverse[j, k] -= factor * inverse[i, k];
                }
            }
        }
        return inverse;
    }

    static void writeOutput(float[,] matrix, string filename)
    {
        using (StreamWriter sw = new StreamWriter(filename))
        {
            sw.WriteLine(matrix.GetLength(0));
            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    sw.Write(matrix[i, j] + " ");
                }
                sw.WriteLine();
            }
        }
        return;
    }
    
    public static void Main()
    {
        string input_file = "input.txt";
        string output_file = "output/cs.txt";
        float[,] matrix = readInput(input_file);
        float[,] inverseMatrix = inverseGaussJordan(matrix);
        writeOutput(inverseMatrix, output_file);
    }
}