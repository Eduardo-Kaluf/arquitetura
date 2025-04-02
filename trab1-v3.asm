;; r0 contador e elemento que vai no vetor
;; r1 1 fixo
;; r2 endereço de saida pro brzr
;; r3 endereço do vetor

_setupMemoria:

    ;; Mem[-1] = Mem[A] (COMEÇO DO VETOR A) (0x70) (112)
    addi 7
    add r2, r0
    addi -3
    slr r2, r0
    addi -5
    sub r2, r0
    st r2, r0
    ;;

    ;; Mem[-3] = 10 = Counter (0x0a)
    addi 6
    addi 5
    add r1, r0
    sub r0, r0
    addi -3
    st r1, r0
    ;;

    ;; Mem[-4] = 10 fixo (0x0a)
    addi -1
    st r1, r0
    ;;

    ;; Mem[-5] = 20 fixo (0x14)
    addi -1
    add r1, r1
    st r1, r0
    ;;

    ;; Mem[-2] = endereço de entrada do loopSoma (INCIO DO VETOR (r2) - Numero de instruções do último loop) (0x52)
    sub r0, r0
    addi -2
    add r3, r0
    sub r2, r1
    addi 7
    addi 5
    sub r2, r0
    st r2, r3
    ;;

_setupLoop1:

    ;; r1 = 1
    sub r0, r0
    sub r1, r1
    addi 1
    add r1, r0
    ;;

    ;; r3 = (FINAL DO VETOR A) = A[9] (0x79)
    addi -2
    ld r0, r0
    addi 7
    addi 2
    sub r3, r3
    add r3, r0
    ;;

    ;; r2 = endereço de saida do LOOP 1 (0x34)
    sub r0, r0
    sub r2, r2
    addi 6
    add r2, r0
    addi -3
    slr r2, r0
    addi 1
    add r2, r0
    sub r0, r0
    ;;

    ;; r0 = 20 (0x14)
    addi -5
    ld r0, r0
    ;;

_loop1:
    addi -2
    st r0, r3
    sub r3, r1
    brzr r0, r2
    ji _loop1

_setupLoop2:

    ;; r2 = saida do segundo loop (0x43)
    sub r2, r2
    addi 4
    slr r0, r0
    addi 3
    add r2, r0
    ;;

    ;; r3 = POSIÇÃO FINAL DO SEGUNDO VETOR (0x83)
    sub r0, r0
    addi -5
    ld r0, r0
    add r3, r0
    ;;

    ;; r1 já é igual a 1

    ;; r0 já é igual a 20 (0x14)

_loop2:
    addi -1
    st r0, r3
    sub r3, r1
    addi -1
    brzr r0, r2
    ji _loop2

_setupLoop3:

    ;; r3 = final do terceiro vetor (0x8D)
    ;; r1 = 10 (0x0A) Counter
    addi -3
    ld r1, r0
    addi -2
    ld r0, r0
    add r3, r0
    ;;

    ;; r2 = Saida do terceiro loop (POSIÇÃO -2 da memoria)
    sub r0, r0
    addi -2
    ld r2, r0
    ;;

_loop3:
    xor r0, r0
    st r3, r0
    addi 1
    sub r3, r0
    sub r1, r0
    brzr r1, r2
    ji _loop3

_loopSoma:
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
    sub r0, r0
