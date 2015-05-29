.text
	main:
		la $s0, Matriz
		li $t0, 4   #tamanho do char
		li $t2, 0   #count para o "\n"
		
		li $s1, 0
		
		addi $t1, $s0, 36
		loop:
			la $t3, Ponto
			sw $t3, 0($s0)  #zera a posicao
			add $s0, $s0, $t0
			bne $s0, $t1, loop #se for != de 36
			 
		li $v0, 4
		la $a0, Intro
		syscall
		la $s0, Matriz
		
		print:
			li $v0, 4
			lw $a0, 0($s0)
			syscall
			li $v0, 4
			la $a0, Espaco
			syscall
			add $s0, $s0, $t0
			addi $t2, $t2, 1
			bne $t2, 3, print
			li $v0, 4
			la $a0, Linha
			syscall
			li $t2, 0
			bne $s0, $t1, print #
			
		
		
		insere:
			li $v0, 4
			la $s0, Matriz
			la $a0, Pergunta
			syscall
			li $v0, 5 #scanf do usuario
			syscall
			move $t3, $v0 #move para o t3 = i
			li $v0, 5
			syscall
			move $t4, $v0 #move para o t4 = j
		
		mul $t3, $t3, 3 # i * 3
		add $t3, $t3, $t4 # i + j
		mul $t3, $t3, 4 # total * 4
		add $s0, $s0, $t3 #v[t3]
		lw $t4, 0($s0)
		la $t5, Ponto
		beq $t4, $t5, vazio
		li $v0, 4
		la $a0, Erro
		syscall
		j insere
		
		vazio:
		beqz $s1, xis #se 0, xis
		la $s2, o 
		not $s1, $s1
		j escreve
		xis:
			la $s2, x
			not $s1, $s1
		escreve:
			sw $s2, 0($s0)
			la $s0, Matriz
			j print
		

#li $v0, 5   # 5 = pegar um inteiro do usuario
	#syscall



.data
final: .word 1
Matriz: .space 36
Intro: .asciiz "Jogo da velha, matriz inicial:\n"
Erro: .asciiz "Posicao ja ocupada\n"
Espaco: .asciiz " "
Linha: .asciiz "\n"
Pergunta: .asciiz "Digite a posicao que deseja jogar (0 a 2) para i e j: "
x: .asciiz "X"
o: .asciiz "O"
Ponto: .asciiz "."