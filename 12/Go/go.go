package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func writeOutput(filename string, matrix [][]float64, n int) {
	file, err := os.Create(filename)
	if err != nil {
		fmt.Println("File not found")
		return
	}
	defer file.Close()

	fmt.Fprintf(file, "%d\n", n)
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			fmt.Fprintf(file, "%f ", matrix[i][j])
		}
		fmt.Fprintf(file, "\n")
	}
}

func inverseGaussJordan(matrix [][]float64, n int) [][]float64 {
	// Create identity matrix
	identity := make([][]float64, n)
	for i := 0; i < n; i++ {
		identity[i] = make([]float64, n)
		identity[i][i] = 1
	}

	// Augment matrix
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			matrix[i] = append(matrix[i], identity[i][j])
		}
	}

	// Gauss-Jordan elimination
	for i := 0; i < n; i++ {
		// Find pivot
		pivot := matrix[i][i]
		if pivot == 0 {
			fmt.Println("Matrix is not invertible")
			return nil
		}

		// Normalize row
		for j := 0; j < 2*n; j++ {
			matrix[i][j] /= pivot
		}

		// Eliminate other rows
		for j := 0; j < n; j++ {
			if j == i {
				continue
			}

			factor := matrix[j][i]
			for k := 0; k < 2*n; k++ {
				matrix[j][k] -= factor * matrix[i][k]
			}
		}
	}

	// Extract inverse matrix
	inverseMatrix := make([][]float64, n)
	for i := 0; i < n; i++ {
		inverseMatrix[i] = make([]float64, n)
		for j := 0; j < n; j++ {
			inverseMatrix[i][j] = matrix[i][j+n]
		}
	}

	return inverseMatrix
}

func printMatrix(matrix [][]float64, n int) {
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			fmt.Printf("%f ", matrix[i][j])
		}
		fmt.Println()
	}
}

func main() {
	// READING
	inputFile := "input.txt"
	outputFile := "output/go.txt"

	file, err := os.Open(inputFile)
	if err != nil {
		fmt.Println("File not found")
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	scanner.Scan()

	nStr := scanner.Text()
	n, err := strconv.Atoi(nStr)
	if err != nil {
		fmt.Println("Invalid n")
		return
	}

	matrix := make([][]float64, n)
	for i := 0; i < n; i++ {
		matrix[i] = make([]float64, n)
	}

	for i := 0; i < n; i++ {
		if !scanner.Scan() {
			fmt.Println("Invalid matrix")
			return
		}
		row := scanner.Text()
		values := strings.Fields(row)

		for j := 0; j < n; j++ {
			val, err := strconv.ParseFloat(values[j], 64)
			if err != nil {
				fmt.Println("Invalid matrix value:", err)
				return
			}
			matrix[i][j] = val
		}
	}

	// PROCESSING
	inverseMatrix := inverseGaussJordan(matrix, n)

	// // WRITING
	writeOutput(outputFile, inverseMatrix, n)
}
