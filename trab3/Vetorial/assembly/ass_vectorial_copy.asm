
s.and r2 r0
s.and r3 r0

s.movh 1
s.movl 14

s.add r3 r1

s.movh 0
s.movl 3
s.add r2 r1

v.sub r2 r2
v.sub r3 r3

v.movh 0 
v.movl 11
v.add r2 r1
v.add r3 r1

v.movh 6
v.movl 4

v.add r3 r1
v.movh 0

v.sub r3 r0 

v.sub r2 r0 

s.brzr r2 r3

s.movh 0
s.movl 1

v.st r2 r3

v.sub r3 r1
v.sub r2 r1

s.sub r2 r1

s.movh 1
s.movl 4

s.brzr r0 r1


s.add r3 r1 

s.movh 0
s.movl 3


s.add r2 r1

s.add r3 r1
s.add r3 r1

v.movh 1
v.movl 8

v.add r3 r1
v.sub r2 r2

v.movl 15
v.add r2 r1
v.sub r2 r0 

v.movh 0
v.movl 4

s.brzr r2 r3 

s.movh 0
s.movl 1
s.sub r2 r1

v.st r2 r3

v.sub r3 r1
v.sub r2 r1

s.movh 2
s.movl 13

s.brzr r0 r1
