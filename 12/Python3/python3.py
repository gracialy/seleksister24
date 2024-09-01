def read_input(file):
    with open(file, 'r') as file:
        n = int(file.readline().strip())
        matrix = [list(map(float, file.readline().split())) for _ in range(n)]
    return n, matrix

def write_output(file, n, inverse_matrix):
    with open(file, 'w') as file:
        file.write(str(n) + '\n')
        for row in inverse_matrix:
            file.write(' '.join(map(str, row)) + '\n')

def inverse_gauss_jordan(n, matrix):
    # Create an identity matrix
    identity = [[float(i == j) for j in range(n)] for i in range(n)]
    # Augment the matrix
    augmented_matrix = [row + identity[i] for i, row in enumerate(matrix)]
    # Perform row operations
    for i in range(n):
        # Normalize the row
        factor = augmented_matrix[i][i]
        augmented_matrix[i] = [element / factor for element in augmented_matrix[i]]
        # Eliminate the element in the other rows
        for j in range(n):
            if i == j:
                continue
            factor = augmented_matrix[j][i]
            augmented_matrix[j] = [element - factor * augmented_matrix[i][index] for index, element in enumerate(augmented_matrix[j])]
    # Extract the inverse matrix
    inverse_matrix = [row[n:] for row in augmented_matrix]
    return inverse_matrix

if __name__ == '__main__':
    n, matrix = read_input('input.txt')
    inverse_matrix = inverse_gauss_jordan(n, matrix)
    write_output('output/python3.txt', n, inverse_matrix)