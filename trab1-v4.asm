_setupMemoria:

    ;; Mem[-1] = (COMEÇO DO VETOR A) (0x70) (112)
    addi 7
    add r2, r0
    addi -3
    slr r2, r0
    addi -5
    sub r2, r0
    st r2, r0
    ;;

    ;; Mem[-3] = COUNTER (0x0a)
    addi 6
    addi 5
    add r1, r0
    sub r0, r0
    addi -3
    st r1, r0
    ;;

    ;; Mem[-4] = 10 FIXO (0x0a)
    addi -1
    st r1, r0
    ;;

    ;; Mem[-5] = 20 FIXO (0x14)
    addi -1
    add r1, r1
    st r1, r0
    ;;

    ;; Mem[-2] = ENTRADA DO "loopSoma" (INCIO DO VETOR (r2) - N DE INSTRUÇÕES DO "loopSoma") (0x52)
    sub r0, r0
    addi -2
    add r3, r0
    sub r2, r1
    addi 7
    addi 5
    sub r2, r0
    st r2, r3
    ;;

_setupLoopEven:

    ;; r1 = 1 (0x01)
    sub r0, r0
    sub r1, r1
    addi 1
    add r1, r0
    ;;

    ;; r3 = (FINAL DO VETOR A) (0x79) (121)
    addi -2
    ld r0, r0
    addi 7
    addi 2
    sub r3, r3
    add r3, r0
    ;;

    ;; r2 = SAIDA DO LOOP EVEN (0x34)
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

_loopEven:
    addi -2     ;; r0 -= 2
    st r0, r3   ;; A[r3] = r0 
    sub r3, r1  ;; r3 -= 1
    brzr r0, r2 ;; if (r0 == 0) break
    ji _loopEven

_setupLoopOdd:

    ;; r2 = SAIDA DO LOOP ODD (0x43)
    sub r2, r2
    addi 4
    slr r0, r0
    addi 3
    add r2, r0
    ;;

    ;; r3 = (FINAL DO VETOR B) (0x83) (131)
    sub r0, r0
    addi -5
    ld r0, r0
    add r3, r0
    ;;

    ;; r1 JÁ É IGUAL A 1  (0x01)

    ;; r0 JÁ É IGUAL A 20 (0x14)

_loopOdd:
    addi -1     ;; r0 -= 1
    st r0, r3   ;; B[r3] = r0
    sub r3, r1  ;; r3 -= 1
    addi -1     ;; r0 -= 1
    brzr r0, r2 ;; if (r0 == 0) break
    ji _loopOdd

_setupLoopZero:

    ;; r3 = (FINAL DO VETOR R) (0x8D) (141)
    ;; r1 = COUNTER (0x0A)
    addi -3
    ld r1, r0
    addi -2
    ld r0, r0
    add r3, r0
    ;;

    ;; r2 = SAIDA DO LOOP ZERO (POSIÇÃO -2 da memoria) (0x52)
    sub r0, r0
    addi -2
    ld r2, r0
    ;;

_loopZero:
    sub r0, r0  ;; r0 = 0
    st r0, r3   ;; R[r3] = r0
    addi 1      ;; r0 = 1
    sub r3, r0  ;; r3 -= 1
    sub r1, r0  ;; r1 -= 1
    brzr r1, r2 ;; if (r1 == 0) break
    ji _loopZero

_loopSum:
    sub r0, r0  ;; r0 = 0
    addi -1     ;; r0 = -1
    ld r3, r0   ;; r3 = Mem[-1] (COMEÇO DO VETOR A)
    addi 2      ;; r0 = 1
    add r3, r0  ;; r3 += 1
    addi -2     ;; r0 = -1
    st r3, r0   ;; Mem[-1] = (POSIÇÃO ATUAL DO VETOR A + 1)
    addi 2      ;; r0 = 1
    sub r3, r0  ;; r3 -= 1 (POSIÇÃO ATUAL DO VETOR A) 
    addi -5     ;; r0 = -4
    ld r0, r0   ;; r0 = Mem[-4] (0x0a)
    ld r1, r3   ;; r1 = A[r3]
    add r3, r0  ;; r3 += 10
    ld r2, r3   ;; r2 = B[r3]
    add r1, r2  ;; r1 = A[r3] + B[r3]
    add r3, r0  ;; r3 += 10
    st r1, r3   ;; R[r3] = A[r3] + B[r3]
    sub r0, r0  ;; r0 = 0
    addi -3     ;; r0 = -3
    ld r1, r0   ;; r1 = Mem[-3] (COUNTER)
    addi 4      ;; r0 = 1
    sub r1, r0  ;; r1 -= 1
    addi -4     ;; r0 = -3
    st r1, r0   ;; Mem[-3] = COUNTER - 1
    not r1, r1  ;; r1 = !r1 (zero a não ser na interação de saída)
    addi 1      ;; r0 = -2
    ld r2, r0   ;; r2 = Mem[-2] ENTRADA DO "loopSoma"
    brzr r1, r2 ;; if (r1 == 0) continue

    add r0, r0 ;; Apenas para mostrar que 
    sub r0, r0 ;; O loop saiu corretamente
