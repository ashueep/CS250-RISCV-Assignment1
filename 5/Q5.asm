.data
	input1: .asciz "Enter 2-digit number: "
	output1: .asciz "\nAddress is: "
	output2: .asciz "\nString: "
	string: .asciz ""
	
.text:
	la a0, input1
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	
	add s0, a0, x0
	la s1, string
	
print_int:
	add t1, s0, x0
	li t4, 10
	addi sp, sp, -3
	addi t6, x0, 2
	add t5, sp, t6
	loop1:
		ble t1, x0, exit_loop1
		li t2, 0
		li t3, 0
		loop2:
			blt t1, t4, exit_loop2
			addi t1, t1, -10
			addi t2, t2, 1
			j loop2
		exit_loop2:
		addi t1, t1, '0'
		sb t1, 0(t5)
		add t1, t2, x0
		addi t6, t6, -1
		add t5, sp, t6
		j loop1
		
	exit_loop1:
	
	sb t1, 0(sp)
	lb t1, 1(sp)
	sb t1, 0(s1)
	lb t1, 2(sp)
	sb t1, 1(s1)
	addi t1, x0, '\0'
	sb t1, 2(s1)
	
	la a0, output1
	li a7, 4
	ecall
	la a0, string
	li a7, 34
	ecall
	
	la a0, output2
	li a7, 4
	ecall
	
	la a0, string
	ecall
	
	li a7, 10
	ecall
	
	
	
			
			
			
			
			 
	