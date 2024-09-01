<?php

function read_input($file) {
    $handle = fopen($file, 'r');
    $n = intval(fgets($handle));
    $matrix = [];
    for ($i = 0; $i < $n; $i++) {
        $matrix[] = array_map('floatval', explode(' ', fgets($handle)));
    }
    fclose($handle);
    return [$n, $matrix];
}

function write_output($file, $n, $inverse_matrix) {
    $handle = fopen($file, 'w');
    fwrite($handle, $n . "\n");
    foreach ($inverse_matrix as $row) {
        fwrite($handle, implode(' ', array_map('strval', $row)) . "\n");
    }
    fclose($handle);
}

function inverse_gauss_jordan($n, $matrix) {
    // Create an identity matrix
    $identity = array_map(function($i) use ($n) {
        return array_map(function($j) use ($i) {
            return floatval($i == $j);
        }, range(0, $n - 1));
    }, range(0, $n - 1));

    // Augment the matrix
    $augmented_matrix = array_map(function($i, $row) use ($identity) {
        return array_merge($row, $identity[$i]);
    }, range(0, $n - 1), $matrix);

    // Perform row operations
    for ($i = 0; $i < $n; $i++) {
        // Normalize the row
        $factor = $augmented_matrix[$i][$i];
        $augmented_matrix[$i] = array_map(function($element) use ($factor) {
            return $element / $factor;
        }, $augmented_matrix[$i]);

        // Eliminate the element in the other rows
        for ($j = 0; $j < $n; $j++) {
            if ($i == $j) {
                continue;
            }
            $factor = $augmented_matrix[$j][$i];
            $augmented_matrix[$j] = array_map(function($index, $element) use ($i, $factor, $augmented_matrix) {
                return $element - $factor * $augmented_matrix[$i][$index];
            }, array_keys($augmented_matrix[$j]), $augmented_matrix[$j]);
        }
    }

    // Extract the inverse matrix
    $inverse_matrix = array_map(function($row) use ($n) {
        return array_slice($row, $n);
    }, $augmented_matrix);

    return $inverse_matrix;
}

list($n, $matrix) = read_input('input.txt');
$inverse_matrix = inverse_gauss_jordan($n, $matrix);
write_output('output/php.txt', $n, $inverse_matrix);