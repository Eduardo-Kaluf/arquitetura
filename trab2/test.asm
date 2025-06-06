; Instructions test for EGG REDUX-V.

	; addi, prepare for jump.
	addi 5

	; Copy addr.
	add r1, r0
	; Zero r0 to test branching.
	sub r0, r0

	; The first addi should not be performed.
	brzr r0, r1
	addi 0xf
	addi 1
	; And this should not branch.
	brzr r0, r1

	; The addi should not be performed.
	ji ji_test
	addi 0xf

	; Arithmetic instructions.
ji_test:
	sub r0, r0 ; r0 = 0
	not r0, r0 ; r0 = 1
	add r0, r0 ; r0 = 2
	; For testing logical.
	sub r1, r1 ; r1 = 0
	not r1, r1 ; r1 = 1
	or r0, r1  ; r0 = 3
	and r0, r1 ; r0 = 1
	slr r0, r1 ; r0 = 2
	xor r0, r1 ; r0 = 3
	srr r0, r1 ; r0 = 1

	; Prepare address for load/store
	sub r0, r0
	sub r1, r1
	addi 0x0f
	add r1, r0
	sub r0, r0
	addi 0x0e
	st r0, r1
	sub r0, r0
	ld r0, r1

	; Calls
	ebreak

	sub r0, r0
	sub r1, r1
	sub r2, r2
	addi 2
	add r2, r0
	sub r0, r0
	addi 1
	add r1, r0
	sub r0, r0
	ecall


;; 0x45 0xc4 0xd0 0x01 0x4f 0x41 0x01 0x12 0x4f 0xd0 0x80 0xc0 0xd5 0x85 0xa1 0x91 0xe1 0xb1 0xf1 0xd0 0xd5 0x4f 0xc4 0xd0 0x4e 0x31 0xd0 0x21 0x50 0xd0 0xd5 0xda 0x42 0xc8 0xd0 0x41 0xc4 0xd0 0x60