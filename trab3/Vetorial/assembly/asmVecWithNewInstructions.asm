s.and r2 r0 ;; Zera os registradores R2 e R3
s.and r3 r0

v.movh 0
v.movl 4
v.add r3 r1 ;; Adiciona o 'espaçamento' para R3

v.movl 0
v.movh -8
v.add r2 r1 ;; Adiciona o endereço do Vetor A para R2

v.add r2 r0 ;; Faz com que cada Lane do vetorial aponte para V[A] + ID

v.sub r1 r1
v.add r1 r0 ;; Adiciona os valores iniciais do Vetor A em R1

s.movl 3
s.add r2 r1
s.movl 2
s.rep r1 r2 ;; Preenche o Vetor A
v.st r1 r2
v.add r1 r3
v.add r2 r3

v.movh 1 
v.movl 4
v.add r1 r0 ;; Adiciona os valores inicias do Vetor B em R1

s.rep r1 r2 ;; Preenche o Vetor B
v.st r1 r2
v.add r1 r3
v.add r2 r3

v.sub r1 r1
v.sub r2 r2
v.sub r3 r3
s.sub r1 r1
s.sub r2 r2
s.sub r3 r3

v.movh -8   
v.add r3 r1 
v.add r3 r0 ;; endereço do Vetor A
v.sub r1 r1

s.movl -3
s.add r2 r1
s.movl 2
s.rep r1 r2
v.ld r2 r3  ;; R2 = M[A]
v.movl -4   ;; Distancia entre os vetores
v.add r3 r1 ;; Endereço do Vetor B
v.ld r1 r3  ;; R1 = M[B]
v.add r2 r1 ;; Soma dos vetores
v.movh 0    ;;
v.movl -4   ;; Distancia entre os vetores
v.add r3 r1 ;; Endereço do Vetor R
v.st r2 r3  ;; Guarda a soma no Vetor R
v.sub r3 r1 ;; 
v.sub r3 r1 ;; 
v.movl 4    ;;
v.add r3 r1 ;; Endereço do Vetor A + 4 * intereção atual

s.movh 3    ;; HALT
s.movl 6
s.brzr r0 r1
