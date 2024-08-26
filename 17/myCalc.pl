#!/usr/bin/perl

sub add_bitwise {
    my ($a, $b) = @_;
    LOOP: {
        goto END_LOOP if $b == 0;
        my $carry = $a & $b;
        $a = $a ^ $b;
        $b = $carry << 1;
        goto LOOP;
    }
    END_LOOP: {
        my $result = unpack("l", pack("l", $a));
        return $result;
    }
}

sub substract_bitwise {
    my ($a, $b) = @_;
    $b = add_bitwise(~$b, 1);
    return add_bitwise($a, $b);
}

sub muldiv_help {
    my ($a, $b) = @_;
    
    my $negative = 0;
    if ($a < 0 && $b < 0) {
        $a = add_bitwise(~$a, 1);
        $b = add_bitwise(~$b, 1);
    }
    elsif ($a < 0) {
        $a = add_bitwise(~$a, 1);
        $negative = 1;
    }
    elsif ($b < 0) {
        $b = add_bitwise(~$b, 1);
        $negative = 1;
    }

    return ($a, $b, $negative);
}

sub multiply_bitwise {
    my ($a, $b) = @_;
    my ($a, $b, $negative) = muldiv_help($a, $b);
    my $result = 0;
    LOOP: {
        goto END_LOOP if $b == 0;
        $result = add_bitwise($result, $a) if $b & 1;
        $a = $a << 1;
        $b = $b >> 1;
        goto LOOP;
    }
    END_LOOP: {
        return $negative ? add_bitwise(~$result, 1) : $result;
    }
}

sub divide_bitwise {
    my ($a, $b) = @_;
    if ($b == 0) {
        return 0;
    }
    my ($a, $b, $negative) = muldiv_help($a, $b);
    my $result = 0;
    LOOP: {
        goto END_LOOP if $a < $b;
        $a = substract_bitwise($a, $b);
        $result = add_bitwise($result, 1);
        goto LOOP;
    }
    END_LOOP: {
        return $negative ? add_bitwise(~$result, 1) : $result;
    }
}

sub power_bitwise {
    my ($a, $b) = @_;
    my $result = 1;
    LOOP: {
        goto END_LOOP if $b == 0;
        $result = multiply_bitwise($result, $a) if $b & 1;
        $a = multiply_bitwise($a, $a);
        $b = $b >> 1;
        goto LOOP;
    }
    END_LOOP: {
        return $result;
    }
}

sub sqrt_bitwise {
    my ($n) = @_;
    return $n if $n < 2;
    my $shift = 2;
    SHIFT_LOOP: {
        if (($n >> $shift) != 0) {
            $shift = add_bitwise($shift, 2);
            goto SHIFT_LOOP;
        }
    }
    my $result = 0;
    LOOP: {
        goto END_LOOP if $shift < 0;
        $result = $result << 1;
        my $large_cand = $result + 1;
        if (multiply_bitwise($large_cand, $large_cand) <= ($n >> $shift)) {
            $result = $large_cand;
        }
        $shift = substract_bitwise($shift, 2);
        goto LOOP;
    }
    END_LOOP: {
        return $result;
    }
}

sub isqrt_bitwise2 {
    my ($n) = @_;
    return divide_bitwise(1, sqrt_bitwise($n));
}

sub isqrt_bitwise {
    my ($x) = @_;
    my $y = $x;
    my $i = unpack("I", pack("f", $y));
    my $exp_mask = 0x7F800000;
    my $magic_number = 0x5f000000;
    $i = substract_bitwise($magic_number, ($i >> 1) & $exp_mask);
    $y = unpack("f", pack("I", $i));
    my $num_newton_iter = 2;
    my $j = 0;
    LOOP: {
        $y = divide_bitwise(add_bitwise(1, multiply_bitwise($x, multiply_bitwise($y, $y))), add_bitwise(2, multiply_bitwise($x, $y)));
        $j = add_bitwise($j, 1);
        goto LOOP if $j < $num_newton_iter;
    }
    END_LOOP: {
        return $y;
    }
}

print "Enable inverse square root? [Y/n]\n";
my $choice = <STDIN>;
chomp $choice;

print "Enter an expression:\n";
my $expression = <STDIN>;
chomp $expression;

my @tokens = split /(\D)/, $expression;
my $result = shift @tokens;

LOOP: {
    $result = unpack("l", pack("l", $result));
    if (@tokens) {
        my $operator = shift @tokens;
        my $operand = shift @tokens;
        $operand = unpack("l", pack("l", $operand));
        if ($operator eq "+") {
            $result = add_bitwise($result, $operand);
        }
        elsif ($operator eq "-") {
            $result = substract_bitwise($result, $operand);
        }
        elsif ($operator eq "*") {
            $result = multiply_bitwise($result, $operand);
        }
        elsif ($operator eq "/") {
            $result = divide_bitwise($result, $operand);
        }
        elsif ($operator eq "^") {
            $result = power_bitwise($result, $operand);
        }
        goto LOOP;
    }
}
$result = unpack("l", pack("l", $result));

if ($choice eq "Y") {
    $result = isqrt_bitwise2($result);
}

print "Result: $result\n";