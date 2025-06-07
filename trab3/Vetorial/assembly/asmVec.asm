;; Zera os registradores R2 e R3
and r2 r0 
and r3 r0 

;; R1 = 30
s.movh 1 
s.movl 14 

;;r3 = 30
s.add r3 r1

;;r2 = 3
s.movh 0
s.movl 3
s.add r2 r1

;;zera regis vetoriais
v.sub r2 r2
v.sub r3 r3

;;r2 = 11
;;r3 = 11
v.movh 0 
v.movh 11
v.add r2 r1
v.add r3 r1

;;valor 100 r1
v.movh 6
v.movl 4

;;r2 primeiros endereços de A
v.add r3 r1
v.movh 0

v.sub r3 r0 ;;111 110 109 108?
v.sub r2 r0 ;;11 10 09 08

;;quando r2 for igual a 0 ele pula para r3
s.brzr r2 r3 20

s.movh 0
s.movl 1
v.st r2 r3

;;r3's recebem -4 todos.
;;r2's recebem -4 todos.
v.sub r3 r1
v.sub r2 r1

s.sub r2 r1; r2 = 2
s.movh 1
s.movl 4

s.brzr r0 r1

;;CALCULO BRANCH r3
;;r3 = 50
s.add r3 r1 

;;R2 CONTADOR
s.movh 0
s.movl 3

;;r2 = 3
s.add r2 r1

;;r3 = 56
s.add r3 r1
s.add r3 r1

;;vr1 = 20
v.movh 1
v.movl 4

;;r3's = endereços finais de B
v.add r3 r1
v.sub r2 r2
v.movl 15

;;r2's = valores finais de B
v.add r2 r1
v.sub r2 r0 

;;vr1 = 4
v.movh 0
s.movh 0
v.movl 4

;;loop preencher B
s.brzr r2 r3 46

;;deremetna 1 no iterador
s.movh 0
s.movl 1
s.sub r2 r1

;;salva os valores de B no endereço de B
v.st r2 r3

;;decrementa 4 nos endereços e valores 
v.sub r3 r1
v.sub r2 r1

;;r1 = 40
v.add r1 r1 

;;r1 recebe endereço de branch
s.mohv 2
s.movl 14

s.brzr r0 r1

;;vr1 = 4
V.movl 4

;;r3 = endereços finais de A
V.sub vr3 vr1 

;;vr1 = 12
V.movl 12

;;sr1 = 30
S.movh 1
S.movl 13

;;r3 recebe endereço para branch
S.add r3 r1 

;;r1sr recebe valor 3
S.movh 0
s.movl 3

;; r2 = 3
S.add r2 r1 

;;loop de soma
s.Brzr r2 r3 
S.movh 0
S.movl 1

;;decrementa iterador
S.sub r2 r1

;;r2 recebe valores de A
V.movl 12
V.ld vr2 vr3 

;;r3 = B
V.add vr3 vr1 

;;r1 recebe valores de B
V.ld r1 r3 

;;(soma Ax e Bx)
V.add r2 r1  

;;r1 recebe valor 12
v.movh 0
V.movl 12 

;;r3 com respectivos endereços de R
V.add r3 r1 R's

;;salva soma em R[x]
V.st r2 r3

;;volta r3 para A[x]
V.sub r3 r1
V.sub r3 r1

;;decrementa 4 em r3
V.movl 4
V.sub r3 r1 (proximos 4)

;;r1 recebe valor para branch
S.Movh 4
S.Movl 1

S.Brzr r0 r1

;;HALT
s.Movh 5
s.Movl 7
s.Brzr r0 r1