inc r1, 1
inc r3, 2
addi 4
slr r0, r0
loadv 10
sub r2, r2
inc r2, 1
loadv 10
sub r2, r2
add r2, r0
addi -7
addi -3
sub r1, r1
add r1, r0
addi -7
addi -3
addv 10
_loopInfinite:
    addi 0
    ji _loopInfinite