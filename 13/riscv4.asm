.data 
	Array: .word 1000
	
.text
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
	
	li a1,6
	
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
	li s8,1

not_found:
	li s9,1

