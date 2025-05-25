;;xor r0
;;xor r1
;;xor r2
;;xor r3

;;salva tamanho do vetor na memoria
movh -1 ;;parte superior r0 negativa
movl -1 ;;parte inferior r0 vai ficar -1
add r1, r0 ;;r1 = -1
movh 1
movl 4 ;;r0 está valendo 12
add r2, r0 ;; r2 = 12
st r2, r1 ;;12 na memoria 

;;calcular endereço primeiro vetor
movh 6
movl 4 ;;r0 com 100 na memoria
sub r1, r1;
add r1, r0 ;; r1 = 100

;;FAZER CALCULO ENDERECO BRANCH guardar em -2
movh 1
movl 13
add r3 r0 ;;r3 = 29
movh -1 
movl -2
st r3 r0

;;r2 = 12, r1 = 100, r0 = 100 r3 = 0
movl 4
sub r3, r3 ;;zera r3
movh 1 r0 = 20
add r3, r0 ;; r0 valendo 20
movh -1
movl -3
st r3, r0 ;; 20 na memoria -3
add r1, r2;; r1 = 112 (inicio de B)

;;loop
movh -1
movl -3
ld r3, r0 ;;r3 recebe 20
movl -1
add r1, r0; r1 == A[11]
add r2, r0 ;; r2 = 11
st r2, r1 ;; A[11] = 11
ld r0, r0 ;;r0 = 12
add r1, r0 ;;r1 == B[11]
add r2, r3 ;; r2 = 31
st r2, r1 ;; b[11] = 31
sub r2, r3;; r2 == 11
sub r1; r0 ;;r1 = A[11]
movl -2
ld r3, r0 ;; r3 = endereco de BRANCH
not r0, r2 ;; r0 só sera algo quando r2 for 0 fim do loop
brzr r0, r3;;

;;r2 == 0; r3 = branch adress r1 = A[0] (100) r0 = 1


;;SOMA DOS VETORES

;;RECALCULAR ENDEREÇO DE BRANCH aqui
movh 1
movl 13
add r3 r0 ;;r3 = 58
movh -1
movl -2
st r3 r0 


movh -1;
movl -1;
ld r2, r0 ;;r2 = 12
movl -4;
st r2, r0 ;; guardou o iterador na memoria
add r1, r2 ;;B[0]52

;;loop
movh -1
movl -1
ld r2, r0;;r2=12
add r1, r0 ;;r1 = A[11]
ld r0, r1 ;;r0 = M[A[11]]
add r1, r2 ;;r1 = B[11]
ld r3, r1 ;;r3 = M[B[11]]
add r3, r0 ;; R2 == M[A[11]] + M[B[11]]
add r1, r2 ;;r1 = R[11]
st r3, r1;; R[11] = soma de A e b

sub r1, r2
sub r1, r2 ;; r1 = A[11]
movh -1
movl -2
ld r3, r0 ;;valor de branch
movl -4
ld r2, r0 ;;r2 = iterador
movl -1
add r2, r0 ;;iterador--
movl -4
st r2, r0 ;;iterador na memoria
not r0, r2
brzr r0, r3

brzi r2

