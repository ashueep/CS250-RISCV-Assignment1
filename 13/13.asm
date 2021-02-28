.data 
	Array: .word 1000
	sorted: .string "The array is : "
	input: .string "\nEnter the number to search : "
	out_found: .string "\nNumber found!"
	out_not_found: .string "\nNumber not found!"
.text
	la a0,sorted
	li a7,4
	ecall
	la t1,Array
	
	li a0,1
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,4
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,8
	sw a0,0(t1)
	
	addi t1,t1,4
	li a0,10
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
	
	la a0,input
	li a7,4
	ecall
	
	li a7,5
	ecall
	addi a1,a0,0
	
	li t1,0
	addi s0,t1,3
	la t4,Array
	
bsearch:
	bgt t1,s0,not_found
	sub s1,s0,t1
	srli s1,s1,1
	add s1,s1,t1
	slli s2,s1,2
	add s2,t4,s2
	lw t3,(s2)
	beq t3,a1,found
	blt t3,a1,c2
	bgt t3,a1,c3
	
c2:
	addi t1,s1,1
	j bsearch

c3:
	addi s0,s1,-1
	j bsearch
	
found:
	la a0,out_found
	li a7,4
	ecall
	j exit

not_found:
	la a0,out_not_found
	li a7,4
	ecall

exit:
