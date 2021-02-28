.data 
	tell: .string "The prefix of the infix string 'a+b-c*d/(e+f)' is: "
	infix: .string "(a+b*c)"
	prefix: .string ""
.text
	la s7,prefix
	la a0,tell
	li a7,4
	ecall
	addi s6,sp,0
	la t1, infix
	li t4,13
	li t3,0
	loop:
		blt t4,t3,exit_loop
		add t5,t1,t4
		lb s0,(t5)
		li t2,'+'
		beq s0,t2,operator
		li t2,'-'
		beq s0,t2,operator
		li t2,'*'
		beq s0,t2,operator
		li t2,'/'
		beq s0,t2,operator
		li t2,')'
		beq s0,t2,push
		li t2,'('
		beq s0,t2,pop_till_open
		j operand

		continue:
		addi t4,t4,-1
		j loop
	

operator:
	beqz s1,push
	jal precedence_of_s0
	jal precedence_of_stack
	
	#compare s3,s4
	bgt s4,s3,popping
	push:
	#pop accordingly
	addi sp,sp,-2
	sb s0,2(sp)
	addi s1,s1,1
	j continue

operand:
	sb s0,(s7)
	addi s7,s7,1
	j continue

popping:
	addi s1,s1,-1
	lb s9,2(sp)
	sb s9,0(s7)
	addi s7,s7,1
	addi sp,sp,2
	j operator
	
pop_till_open:
	li s10,')'
	lb s11,2(sp)
	beq s11,s10,pop_open
	sb s11,0(s7)
	addi s7,s7,1
	addi sp,sp,2
	addi s1,s1,-1
	j pop_till_open
	
pop_open:
	addi s1,s1,-1
	addi sp,sp,2
	j continue

precedence_of_s0:
	li t2,'+'
	beq s0,t2,plus_minus
	li t2,'-'
	beq s0,t2,plus_minus
	li t2,'*'
	beq s0,t2,mul_div
	li t2,'/'
	beq s0,t2,mul_div
	continue_prec:
	jr ra

plus_minus:
	li s3,1
	j continue_prec

mul_div:
	li s3,2
	j continue_prec


precedence_of_stack:
	lb s5,2(sp)
	li t2,'+'
	beq s5,t2,plus_minus_stack
	li t2,'-'
	beq s5,t2,plus_minus_stack
	li t2,'*'
	beq s5,t2,mul_div_stack
	li t2,'/'
	beq s5,t2,mul_div_stack
	li t2,')'
	beq s5,t2,prec_of_open

prec_of_open:
	li s4,-1
	j continue_prec

plus_minus_stack:
	li s4,1
	j continue_prec

mul_div_stack:
	li s4,2
	j continue_prec

exit_loop:
	loop_pop:
		beqz s1,reverse
		addi s1,s1,-1
		lb s9,2(sp)
		sb s9,0(s7)
		addi s7,s7,1
		addi sp,sp,2
		j loop_pop

reverse:
	la a0,prefix
	li a7,4
	ecall
