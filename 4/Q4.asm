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
	
	add s0, x0, a0		#storing input in s0
	li t0, 0
	li t1, 1
	
	li a7, 4
	la a0, output
	ecall
	li t2, 1		#loop variable
	
	add a0, t0, x0		#prints first fibonacci number (0)
	li a7, 1
	ecall
	li a0, 32
	li a7, 11
	ecall
LOOP:					#loop to print the fibonacci sequence
	bge t2, s0, DONE		#exit the loop if loop_variable >= N
	add a0, x0, t1
	li a7, 1
	ecall
	li a0, 32			#to print space
	li a7, 11
	ecall
	add t3, t0, t1			
	add t0, t1, x0			#storing value of t1 in t0
	add t1, t3, x0			#storing value of t3 in t1
	addi t2, t2, 1
	j LOOP

DONE:
	li a7, 10
	ecall
	
	
