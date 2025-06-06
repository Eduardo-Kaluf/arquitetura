;;seta como true os predicados 
;;(ira executar todas as instruções até que se mude o set)
nop 
strue
nop
nop

;;zera os registradores e r0 = -1
movh -1 
nop
sub r1 r1
sub r2 r2

movl -1
nop
nop
sub r3 r3

;;r1 = -1 e r0 = -12
movl 4
nop
nop
add r1 r0 

;;r2 = 12 (tamanho dos vetores)
;;r3 = 1
nop
nop
sub r3 r1
sub r2 r0

;;salva valor 12 na memoria M[-1]
st r2 r1 
nop
nop 
nop

//zera r1 e r0 = 100 
movh 6
nop
nop
sub r1 r1

;;r1 = 100 (endereço de inicio dos vetores, r1 = A[0])
movh 0
nop
nop
add r1 r0

;;r0 = 1 e r1 = B[0]
movl 1
nop
nop
add r1 r2

;;começo do loop de preencher vetor A
;;3 x unrolling preenche de 4 em 4 
;;r1-- e r2-- 
nop
nop
sub r1 r3 
sub r2 r3

;;salva o valor da vez na posição da vez
st r2 r1
nop
sub r1 r3 
sub r2 r3

st r2 r1
nop
sub r1 r3 
sub r2 r3

st r2 r1
nop
sub r1 r3 
sub r2 r3

;;r0 recebe o not r2 (saira do loop quando r2 for 0)
st r2 r1
nop 
not r0 r2
nop

;;branch para o começo do loop
nop
brzi -5
nop
nop

;;r0 = -1
movh -1
nop
nop
nop

movl -1
nop
nop
nop

;;pega o valor 12 da memoria
ld r2 r0 
nop 
nop
nop

;;r1 = B[0]
movh 1
nop
nop
add r1 r2 

;;r0 = 19 e r1 = R[0]
movl 3 
nop
nop
add r1 r2

;;r3 = 20
movh 0
nop
nop
add r3 r0

;;r0 = 0 r3 = 32
movl 0
nop
nop
add r3 r2 

;;r0 = 1
nop
nop
nop
not r0 r0

;;começo do loop de preencher vetor B
;;r3--
;;r1--
nop
nop
sub r3 r0
sub r1 r0

;;salva o valor da vez no endereço certo
;;r2-- (iterador)
st r3 r1
nop
sub r2 r0
nop

;;r0 só será 1 quando r2 for 0 (fim do loop)
nop
nop
nop
not r0 r2

;;branch de loop
nop
brzi -4
nop
nop

;;zera r3 e começa a calcular valor de branch
movh 8
nop 
nop
sub r3 r3

;;r0 = 130
movl 12
nop
nop
nop

;;r3 = endereço de branch
movh -1
nop 
nop
add r3 r0

;;r0 = -2
movl -2
nop
nop
nop

;;salva valor de r3 na memoria
st r3 r0
nop
nop
nop

;;r0 = -1
movl -1
nop
nop
nop

;;r2 = 12
ld r2 r0 
nop
nop
nop

;;r0 = -3
movl -3
nop
nop
nop

;;salva iterador na memoria
st r2 r0 
nop
nop
nop

;;começo do loop de soma
;;2xUnrolling (preenche 3 posições por vez)
;;r0 = -1
movl -1 
nop
nop
nop

;;r2 = 12 (tamanho vetor)
ld r2 r0
nop
nop
nop

;; r1--
nop
nop
add r1 r0 
nop

;;baixa valor da vez de A
;;r1 = B da vez
ld r0 r1 
nop
nop
add r1 r2 

;;baixa valor da vez de B
;;r1 = R da vez (R[x])
ld r3 r1 
nop
nop
add r1 r2 

;;r3 = soma de A[x] e B[x]
movh -1
nop
nop
add r3 r0 

;;salva a soma em R
;;r1 = B da vez
st r3 r1
nop
nop
sub r1 r2

;;r0 = -1
;;r1 = A da vez
movl -1
nop
nop
sub r1 r2 

;;r1 -- (proxima posição)
nop
nop
nop
add r1 r0 

;;baixa valor da vez de A
;;r1 = B da vez
ld r0 r1 
nop
nop
add r1 r2 

;;baixa valor da vez de B
;;r1 = R da vez (R[x])
ld r3 r1 
nop
nop
add r1 r2 

;;r3 = soma de A[x] e B[x]
movh -1
nop
nop
add r3 r0 

;;salva a soma em R
;;r1 = B da vez
st r3 r1
nop
nop
sub r1 r2

;;r0 = -1
;;r1 = A da vez
movl -1
nop
nop
sub r1 r2 

;;r1 -- (proxima posição)
nop
nop
nop
add r1 r0 

;;baixa valor da vez de A
;;r1 = B da vez
ld r0 r1 
nop
nop
add r1 r2 

;;baixa valor da vez de B
;;r1 = R da vez (R[x])
ld r3 r1 
nop
nop
add r1 r2 

;;r3 = soma de A[x] e B[x]
movh -1
nop
nop
add r3 r0 

;;salva a soma em R
;;r1 = B da vez
st r3 r1
nop
nop
sub r1 r2

;;r0 = -2 
movl -2
nop
nop
sub r1 r2 

;;baixa o valor de branch da memoria em r3
ld r3 r0 
nop
nop
nop

;;r0 = -3
movl -3
nop
nop
nop

;;baixa iterador da memoria em r2
ld r2 r0 
nop
nop
nop 

;;r2 = r2 - 3 (iterador - 3, pois faz 3 por loop)
nop
nop
nop
add r2 r0 

;;salva o iterador na memoria
;;r0 recebe !iterador (só sairá do loop quando iterador for 0)
st r2 r0 
nop
nop
not r0 r2

;;branch para começo do loop
movh -1
brzr r0 r3
nop
nop

;; zera r0
nop
nop
nop
sub r0 r0

;;HALT
nop
brzi 0
nop 
nop