s.and r2 r0
s.and r3 r0

v.movl 4
v.add r3 r1
v.movl 0
v.movh -8
v.add r2 r1
v.add r2 r0
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

v.sub r1 r1
v.sub r2 r2
v.sub r3 r3
s.sub r1 r1
s.sub r2 r2
s.sub r3 r3

s.movl -3
s.add r2 r1
s.movl 2

v.movh -8   
v.add r3 r1 
v.add r3 r0 ;; endereço A
v.sub r1 r1

s.rep r1 r2
v.ld r2 r3  ;; r2 = M[A]
v.movl -4   ;;
v.add r3 r1 ;; endereço B
v.ld r1 r3  ;;
v.add r2 r1 ;;
v.movh 0    ;;
v.movl -4   ;;
v.add r3 r1 ;; endereço de R
v.st r2 r3  ;;
v.sub r3 r1 ;;
v.sub r3 r1
v.movl 4
v.add r3 r1


s.movl 1
s.movl 1
s.movl 1