s.and r2 r0 ;; Zera os registradores R2 e R3
s.and r3 r0 

s.movh 1 ;; R1 = 30
s.movl 14 

s.add r3 r1 ;;r3 = 30

s.movh 0 ;;r2 = 3
s.movl 3
s.add r2 r1

v.sub r2 r2 ;;zera regis vetoriais
v.sub r3 r3

v.movh 0 ;;r2 = 11
v.movh 11 ;;r3 = 11
v.add r2 r1
v.add r3 r1

v.movh 6 ;;valor 100 r1
v.movl 4

v.add r3 r1 ;;r2 primeiros endereços de A
v.movh 0

v.sub r3 r0 ;;111 110 109 108?
v.sub r2 r0 ;;11 10 09 08

s.brzr r2 r3 20 ;;quando r2 for igual a 0 ele pula para r3

s.movh 0
s.movl 1
v.st r2 r3

v.sub r3 r1 ;;r3's recebem -4 todos.
v.sub r2 r1 ;;r2's recebem -4 todos.

s.sub r2 r1 ;; r2 = 2
s.movh 1
s.movl 4

s.brzr r0 r1

s.add r3 r1  ;;CALCULO BRANCH r3 = 50

s.movh 0 ;;R2 CONTADOR
s.movl 3

s.add r2 r1 ;;r2 = 3

s.add r3 r1 ;;r3 = 56
s.add r3 r1

v.movh 1 ;;vr1 = 20
v.movl 4

v.add r3 r1 ;;r3's = endereços finais de B
v.sub r2 r2
v.movl 15

v.add r2 r1 ;;r2's = valores finais de B
v.sub r2 r0 

v.movh 0 ;;vr1 = 4
s.movh 0
v.movl 4

s.brzr r2 r3 46 ;;loop preencher B

s.movh 0 ;;deremetna 1 no iterador
s.movl 1
s.sub r2 r1

v.st r2 r3 ;;salva os valores de B no endereço de B

v.sub r3 r1 ;;decrementa 4 nos endereços e valores 
v.sub r2 r1

v.add r1 r1  ;;r1 = 40

s.movh 2 ;;r1 recebe endereço de branch
s.movl 14

s.brzr r0 r1

V.movl 4 ;;vr1 = 4

V.sub r3 vr1  ;;r3 = endereços finais de A

V.movl 12 ;;vr1 = 12

S.movh 1 ;;sr1 = 30
S.movl 13

S.add r3 r1  ;;r3 recebe endereço para branch

S.movh 0 ;;r1sr recebe valor 3
s.movl 3

S.add r2 r1  ;; r2 = 3

s.Brzr r2 r3  ;;loop de soma
S.movh 0
S.movl 1

S.sub r2 r1 ;;decrementa iterador

V.movl 12 ;;r2 recebe valores de A
V.ld vr2 vr3 

V.add vr3 vr1  ;;r3 = B

V.ld r1 r3  ;;r1 recebe valores de B

V.add r2 r1   ;;(soma Ax e Bx)

v.movh 0 ;;r1 recebe valor 12
V.movl 12 

V.add r3 r1   ;;r3 com respectivos endereços de R

V.st r2 r3 ;;salva soma em R[x]

V.sub r3 r1 ;;volta r3 para A[x]
V.sub r3 r1

V.movl 4 ;;decrementa 4 em r3
V.sub r3 r1 ;; (proximos 4)

S.Movh 4 ;;r1 recebe valor para branch
S.Movl 1

S.Brzr r0 r1

s.Movh 5 ;;HALT
s.Movl 7
s.Brzr r0 r1