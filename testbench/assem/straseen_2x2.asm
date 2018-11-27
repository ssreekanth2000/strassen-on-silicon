li $s0 1
li $s1 2
li $s2 3
li $s3 4
li $s4 5
li $s5 6
li $s6 7
li $s7 8

add $t1,$s0,$s3
add $t2,$s4,$s7
mul $t1,$t1, $t2

add $t2,$s2,$s3
mul $t2,$t2, $s4

sub $t3,$s5,$s7
mul $t3,$t3, $s0

sub $t4,$s6,$s4
mul $t4,$t4, $s3

add $t5,$s0,$s1
mul $t5,$t5, $s7

sub $t6,$s2,$s0
add $t7, $s4,$s5
mul $t6,$t6, $t7

sub $t7,$s1,$s3
add $t8, $s6,$s7
mul $t7,$t8, $t7

add $t0, $t1,$t4
sub $t0, $t0, $t5
add $v0, $t0,$t7

add $v1,$t3,$t5

add $a0,$t2,$t4

sub $t0, $t1, $t2
add $t0, $t0,$t3
add $a1, $t0,$t6
