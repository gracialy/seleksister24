const fs = require('fs');

function read_input(filename) {
    try {
        const data = fs.readFileSync(filename, 'utf8');
        const lines = data.split('\n');
        const n = parseInt(lines[0]);
        const matrix = [];
        for (let i = 1; i <= n; i++) {
            const row = lines[i].split(' ').map(Number);
            matrix.push(row);
        }
        return matrix;
    } catch (err) {
        console.log('File not found');
        return null;
    }
}

function write_output(filename, matrix) {
    try {
        let output = matrix.length + '\n';
        for (let i = 0; i < matrix.length; i++) {
            output += matrix[i].join(' ') + '\n';
        }
        fs.writeFileSync(filename, output);
    } catch (err) {
        console.log('File not found');
    }
}

function inverse_gauss_jordan(matrix) {
    const n = matrix.length;
    const augmented_matrix = [];
    for (let i = 0; i < n; i++) {
        augmented_matrix[i] = [];
        for (let j = 0; j < 2 * n; j++) {
            augmented_matrix[i][j] = (j < n) ? matrix[i][j] : (j === n + i) ? 1 : 0;
        }
    }
    for (let i = 0; i < n; i++) {
        const pivot = augmented_matrix[i][i];
        for (let j = 0; j < 2 * n; j++) {
            augmented_matrix[i][j] /= pivot;
        }
        for (let j = 0; j < n; j++) {
            if (i !== j) {
                const factor = augmented_matrix[j][i];
                for (let k = 0; k < 2 * n; k++) {
                    augmented_matrix[j][k] -= factor * augmented_matrix[i][k];
                }
            }
        }
    }
    const inverse_matrix = [];
    for (let i = 0; i < n; i++) {
        inverse_matrix[i] = [];
        for (let j = 0; j < n; j++) {
            inverse_matrix[i][j] = augmented_matrix[i][n + j];
        }
    }
    return inverse_matrix;
}

function print_matrix(matrix) {
    for (let i = 0; i < matrix.length; i++) {
        console.log(matrix[i]);
    }
}

const matrix = read_input('input.txt');
const inverseMatrix = inverse_gauss_jordan(matrix);
write_output('output/javascript.txt', inverseMatrix);
