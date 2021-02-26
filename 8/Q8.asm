.data
	input1: .asciz "Enter number 1: "
	input2: .asciz "Enter number 2: "
	output: .asciz "\nThe product is: "

.text

main:
	la a0, input1
	li a7, 4
	ecall
	li a7, 5
	ecall
	addi sp, sp, -12
	sw a0, 8(sp)
	
	la a0, input2
	li a7, 4
	ecall
	li a7, 5
	ecall
	sw a0, 4(sp)
	
	jal ra, multiply_proc
	
	li a7, 4
	la a0, output
	ecall
	
	lw a0, 0(sp)
	li a7, 1
	ecall
	
	addi sp, sp, 12
	
	li a7, 10
	ecall

multiply_proc:
	lw t0, 8(sp)
	lw t1, 4(sp)
	addi t2, x0, 0
	addi t3, x0, 1
	loop:
		bgt t3, t1, done
		add t2, t0, t2
		addi t3, t3, 1
		j loop
	done:
		sw t2, 0(sp)
		jalr x0, ra, 0
	
