.data
	input1: .asciz "Enter 5 elements for array 1:\n"
	input2: .asciz "\nEnter 5 elements for array 2:\n"
	output: .asciz "\nSum of the arrays: "
	.align 2
	array1: .space 20
	.align 2
	array2: .space 20
	.align 2
	array3: .space 20
.text
main:
	la s0, array1
	la s1, array2
	
	la a0, input1
	li a7, 4
	ecall
	add s2, s0, x0
	jal input
	
	la a0, input2
	li a7, 4
	ecall
	add s2, s1, x0
	jal input
	
	la s6, array3
	li t1, 0
	li t2, 4
	li t3, 0
	loop:
		bgt t1, t2, add_done
		add t4, s0, t3
		add t5, s1, t3
		lw s3, 0(t4)
		lw s4, 0(t5)
		add s5, s3, s4
		add t6, s6, t3
		sw s5, 0(t6)
		addi t3, t3, 4
		addi t1, t1, 1
		j loop
	
	add_done:
		li t1, 0
		li t3, 0
		la a0, output
		li a7, 4
		ecall
	output_loop:
		bgt t1, t2, done
		add t4, s6, t3
		lw a0, 0(t4)
		li a7, 1
		ecall
		li a0, 32
		li a7, 11
		ecall
		addi t1, t1, 1
		addi t3, t3, 4
		j output_loop
	done:
		li a7, 10
		ecall

input:
	li t1, 0
	li t2, 4
	loop1:
		bgt t1, t2, input_done
		li a7, 5
		ecall
		sw a0, 0(s2)
		addi s2, s2, 4
		addi t1, t1, 1
		j loop1
	input_done:
		jalr x0, ra, 0
	

		
		
	
	