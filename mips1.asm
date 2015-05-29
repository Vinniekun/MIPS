.text
	main:
		la $s0, Matriz
		li $t0, 4
		addi $t1, $s0, 36
		loop:
			sw $zero, 0($s0) 
			add $s0, $s0, $t0
			bne $s0, $t1, loop
			 
.data
final: .word 1
Matriz: .space 36
