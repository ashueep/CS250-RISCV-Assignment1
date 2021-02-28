li a7,5
ecall

li t1,1

li t2,0

N_sum:
	beq t1,a0,ExitN_sum
	add t2,t2,t1
	addi t1,t1,1
	j N_sum
	
ExitN_sum:
	addi a0,t2,0
	li a7,1
	ecall
	