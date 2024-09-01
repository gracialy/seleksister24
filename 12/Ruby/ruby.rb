def read_input(file)
    File.open(file, 'r') do |file|
        n = file.readline().strip.to_i
        matrix = Array.new(n) { Array.new(n) }
        n.times do |i|
            matrix[i] = file.readline().strip.split(' ').map(&:to_f)
        end
        return n, matrix
    end
end

def write_output(file, n, inverse_matrix)
    File.open(file, 'w') do |file|
        file.write("#{n}\n")
        inverse_matrix.each do |row|
            file.write("#{row.join(' ')}\n")
        end
    end
end

def inverse_gauss_jordan (n, matrix)
    inverse_matrix = Array.new(n) { Array.new(n) }
    n.times do |i|
        n.times do |j|
            inverse_matrix[i][j] = i == j ? 1 : 0
        end
    end

    n.times do |i|
        pivot = matrix[i][i]
        n.times do |j|
            matrix[i][j] /= pivot
            inverse_matrix[i][j] /= pivot
        end

        n.times do |j|
            next if i == j
            factor = matrix[j][i]
            n.times do |k|
                matrix[j][k] -= factor * matrix[i][k]
                inverse_matrix[j][k] -= factor * inverse_matrix[i][k]
            end
        end
    end

    return inverse_matrix
end

def print_matrix(matrix)
    for row in matrix
        puts row.join(' ')
    end
end

if __FILE__ == $0
    n, matrix = read_input('input.txt')
    inverse_matrix = inverse_gauss_jordan(n, matrix)
    write_output('output/ruby.txt', n, inverse_matrix)
end