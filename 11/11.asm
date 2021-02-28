.data 
	Array: .word 1000
	output: .string "The array is:\n"
	sorted: .string "\nThe sorted array is:\n"
.text
	la a0,output
	li a7,4
	ecall
	la t1,Array
	
	li a0,3
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,4
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,1
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,7
	sw a0,0(t1)
	
	li t1,0
	li s0,16
	loop1:
		beq t1,s0,continue2
		la s1,Array
		add t2,s1,t1
		lw a0,(t2)
		li a7,1
		ecall
		li a0,32
		li a7,11
		ecall
		addi t1,t1,4
		j loop1
	continue2:	
	la s0,Array
	addi s10,s0,16
	addi s11,s0,12
	la a0,sorted
	li a7,4
	ecall
	
outer_loop:
	beq s0,s10,exit_outer
	la s1,Array
	inner_loop:	
		beq s1,s11,exit_inner
		lw t2,0(s1)
		lw t3,4(s1)
		bgt t2,t3,swap
		continue:
		addi s1,s1,4
		j inner_loop
	exit_inner:
		addi s0,s0,4
		j outer_loop
	
exit_outer:
	li t1,0
	li s0,16
	loop:
		beq t1,s0,continue1
		la s1,Array
		add t2,s1,t1
		lw a0,(t2)
		li a7,1
		ecall
		li a0,32
		li a7,11
		ecall
		addi t1,t1,4
		j loop
	continue1:
	li a7,10
	ecall

swap:
	sw t2,4(s1)
	sw t3,(s1)
	j continue
