.data
output: .asciz "Hello World!\n"

.text
	la a0, output
	li a7, 4
	ecall