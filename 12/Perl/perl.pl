use strict;
use warnings;

sub read_input {
    my ($file) = @_;
    open(my $fh, '<', $file) or die "Failed to open file: $!";
    my $n = <$fh>;
    chomp($n);
    my @matrix;
    for (my $i = 0; $i < $n; $i++) {
        my $line = <$fh>;
        chomp($line);
        my @row = split(' ', $line);
        push @matrix, \@row;
    }
    close($fh);
    return ($n, \@matrix);
}

sub write_output {
    my ($file, $n, $inverse_matrix) = @_;
    open(my $fh, '>', $file) or die "Failed to open file: $!";
    print $fh "$n\n";
    foreach my $row (@$inverse_matrix) {
        print $fh join(' ', @$row) . "\n";
    }
    close($fh);
}

sub inverse_gauss_jordan {
    my ($n, $matrix) = @_;
    # Create an identity matrix
    my @identity;
    for (my $i = 0; $i < $n; $i++) {
        my @row;
        for (my $j = 0; $j < $n; $j++) {
            push @row, ($i == $j) ? 1 : 0;
        }
        push @identity, \@row;
    }
    # Augment the matrix
    my @augmented_matrix;
    for (my $i = 0; $i < $n; $i++) {
        my @row = (@{$matrix->[$i]}, @{$identity[$i]});
        push @augmented_matrix, \@row;
    }
    # Perform row operations
    for (my $i = 0; $i < $n; $i++) {
        # Normalize the row
        my $factor = $augmented_matrix[$i][$i];
        for (my $j = 0; $j < 2 * $n; $j++) {
            $augmented_matrix[$i][$j] /= $factor;
        }
        # Eliminate the element in the other rows
        for (my $j = 0; $j < $n; $j++) {
            next if $i == $j;
            my $factor = $augmented_matrix[$j][$i];
            for (my $k = 0; $k < 2 * $n; $k++) {
                $augmented_matrix[$j][$k] -= $factor * $augmented_matrix[$i][$k];
            }
        }
    }
    # Extract the inverse matrix
    my @inverse_matrix;
    for (my $i = 0; $i < $n; $i++) {
        my @row = @{$augmented_matrix[$i]}[$n..(2*$n-1)];
        push @inverse_matrix, \@row;
    }
    return \@inverse_matrix;
}

my ($n, $matrix) = read_input('input.txt');
my $inverse_matrix = inverse_gauss_jordan($n, $matrix);
write_output('output/perl.txt', $n, $inverse_matrix);