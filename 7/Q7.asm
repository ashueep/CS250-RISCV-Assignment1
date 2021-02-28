.data
	input1: .string "Enter the first number: "
	input2: .string "Enter the second number: "
	final: .string "The GCD is: "
.text
la a0, input1
li a7, 4
ecall
li a7,5
ecall
addi s1,a0,0

la a0, input2
li a7, 4
ecall
li a7,5
ecall
addi s2,a0,0

addi sp,sp,-12

sw s1,8(sp)
sw s2,4(sp)

gcd:	
	lw t1,8(sp)
	lw t2,4(sp)
	
	
	bge t1,t2,greater
	blt t1,t2,smaller
	
continue:
	beqz t1, done
	
	sw t2,8(sp)
	sw t1,4(sp)
	
	j gcd

greater:
	sub t1,t1,t2
	j continue
	
smaller:
	sub t1,t2,t1
	j continue

done:
	
	la a0, final
	li a7, 4
	ecall
	add a0,t2,zero
	li a7,1
	ecall
	
	
