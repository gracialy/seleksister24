import numpy as np

# Define the matrix
file = 'test.txt'
with open(file, 'r') as file:
    n = int(file.readline().strip())
    matrix = np.array([[int(num) for num in file.readline().split()] for _ in range(n)])

# Calculate the inverse of the matrix
inverse_matrix = np.linalg.inv(matrix)

# Print the inverse matrix
with open('result.txt', 'w') as file:
    file.write(str(n) + '\n')
    for row in inverse_matrix:
        file.write(' '.join(map(str, row)) + '\n')