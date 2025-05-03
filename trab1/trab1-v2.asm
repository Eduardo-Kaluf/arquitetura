;; r0 contador e elemento que vai no vetor
;; r1 1 fixo
;; r2 endereço de saida pro brzr
;; r3 endereço do vetor

;; r3 = 200 (FINAL DO VETOR A)
addi 6
add r3, r0
addi -1
slr r3, r0
addi 3
add r3, r0
sub r0, r0
;;

;; Mem[-1] = 191 = Mem[A] (COMEÇO DO VETOR A) (0xBF)
add r2, r3
addi 7
addi 2
sub r2, r0
sub r0, r0
addi -1
st r2, r0
sub r0, r0
;;

;; Mem[-3] = 10 = Counter
addi 5
addi 5
add r1, r0
sub r0, r0
addi -3
st r1, r0
;;

;; Mem[-4] = 10 fixo
sub r0, r0
addi 5
addi 5
sub r1, r1
add r1, r0
sub r0, r0
addi -4
st r1, r0
;;

;; Mem[-2] = endereço de entrada do loop (0x72)
sub r0, r0
sub r1, r1
sub r2, r2
addi -2
add r1, r0
addi 6
add r2, r0
addi 1
slr r0, r2
addi 7
addi 7
addi 7
addi 7
addi 6
st r0, r1
;;

;; r1 = 1
sub r0, r0
sub r1, r1
addi 1
add r1, r0
sub r0, r0
;;

;; r2 = 40 endereço de saida do LOOP 1 (0x3F)
sub r2, r2
addi 7
add r2, r0
addi -4
slr r2, r0
addi 7
add r2, r0
sub r0, r0
;;

;; r0 = 20 (0x14)
addi 7
addi 7
addi 7
addi -1
;;

_loop1:
addi -2
st r0, r3
sub r3, r1
brzr r0, r2
ji _loop1

;; r3 = 210 POSIÇÃO FINAL DO SEGUNDO VETOR (0xD2)
sub r0, r0
addi 7
addi 7
addi 7
addi -1
add r3, r0
sub r0, r0
;;

;; r2 = saida do segundo loop (0x5C)
sub r2, r2
addi 6
add r2, r0
addi -2
slr r2, r0
addi 0
sub r0, r0
sub r0, r0
;;

;; r1 = 1
sub r1, r1
addi 1
add r1, r0
sub r0, r0
;;

;; r0 = 20
addi 7
addi 7
addi 7
addi -1
;;

_loop2:
addi -1
st r0, r3
sub r3, r1
addi -1
brzr r0, r2
ji _loop2

;; r3 = 220 (0xDC) final do terceiro vetor e r1 = 10 (0x0A)
sub r0, r0
sub r1, r1
addi 7
addi 3
add r3, r0
add r3, r0
add r1, r0
;;

;; r2 = Saida do terceiro loop (0x72) POSSO PEGAR O QUE ESTÁ NA POSIÇÃO -2 da memoria
sub r0, r0
addi 7
addi 7
addi 4
add r2, r0
;;

_loop3:
xor r0, r0
st r3, r0
addi 1
sub r3, r0
sub r1, r0
brzr r1, r2
ji _loop3

;; Começo do loop para somar os vetores
sub r0, r0
addi -1
ld r3, r0
addi 2
add r3, r0
addi -2
st r3, r0
addi 2
sub r3, r0
addi -5
ld r0, r0
ld r1, r3
add r3, r0
ld r2, r3
add r1, r2
add r3, r0
st r1, r3
sub r0, r0
addi -3
ld r1, r0
addi 4
sub r1 ,r0
addi -4
st r1, r0
not r1, r1
addi 1
ld r2, r0
brzr r1, r2

add r0, r0
