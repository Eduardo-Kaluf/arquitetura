_program2:
    ld r0, r0 ;; (r0, rx)
    ld r1, r1 ;; (r0, ry)
    add r3, r0  ;; (rx + ry -> r3)
    st r3, r2
    addi 0 ;; inc 1/all
    ji _program2


;; 0x20 0x25 0xcc 0x3e 0x71 0x1b