#defining data to be used
.data 
input: .asciz "Enter the value of N: "
output: .asciz "The N Fibonacci Numbers:\n"

#code starts from here
.text
	li a7, 4		#setting a7 to print a string
	la a0, input		
	ecall
	
	li a7, 5		#taking input N
	ecall
	
	add s1, x0, a0		#storing input in s0
	li t0, 0
	li s0, 0
	addi s1, s1, -1
	li a7, 4
	la a0, output
	ecall
	loop:
		bgt t0, s1, end_loop
		addi s0, t0, 0
		jal fibo
	        
		add a0, s0, x0
		li a7, 1
		ecall
		
		li a0, 32
		li a7, 11
		ecall
		
		addi t0, t0, 1
		j loop
	
	end_loop:
		li a7, 10
		ecall
	
fibo:
	addi sp, sp, -12
	sw ra, 0(sp)
	li t1, 1
	beqz s0, rzero
	ble s0, t1, one
	sw s0, 4(sp)
	addi s0, s0, -1
	jal fibo
	sw s0, 8(sp)
	lw s0, 4(sp)
	addi s0, s0, -2
	jal fibo
	lw t2, 8(sp)
	add s0, s0, t2
	j return
	
	rzero:
		li s0, 0
		j return
	one:
		li s0, 1
	return:
		lw ra, 0(sp)
		addi sp, sp, 12
		jr ra
	
	
