li a7,5
ecall

addi s7,a0,1

li s5,1
li s6,1
addi sp,sp,-12

loop:
	beq s6,s7,exit_loop
	sw s5,8(sp)
	sw s6,4(sp)
	jal ra,multiply_proc
	addi s5,t2,0
	addi s6,s6,1
	j loop
	

multiply_proc:
	lw t0, 8(sp)
	lw t1, 4(sp)
	addi t2, x0, 0
	addi t3, x0, 1
	loop1:
		bgt t3, t1, done
		add t2, t0, t2
		addi t3, t3, 1
		j loop1
	done:
		jalr x0, ra, 0
	
	
exit_loop:
	
	addi a0,s5,0
	li a7,1
	ecall
	