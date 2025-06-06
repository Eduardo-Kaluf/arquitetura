s.and r2 r0
s.and r3 r0

v.movl 4
v.add r3 r1
v.movh 7
v.add r2 r1
v.sub r1 r1
v.add r1 r0

s.movl 3
s.add r2 r1
s.movl 2
s.rep r1 r2
v.st r1 r2
v.add r1 r3
v.add r2 r3

v.movh 1
v.movl 4
v.add r1 r0
s.rep r1 r2
v.st r1 r2
v.add r1 r3
v.add r2 r3


