.data 
	mangso :.word 100
	nhapso:.asciiz "Nhap 5 so: "
	phay:.asciiz "\n"	
	xd:.asciiz "\n"
.text
	la $a0, nhapso
	li $v0, 4
	syscall 
	li $v0,5
	syscall
	move $s0, $v0
	move $s1,$s0
	la $t0, mangso
	b do
do:
	beq $s1,0,ndo
	
	li $v0,5
	syscall
	sw $v0, ($t0)
	addi $s1,$s1,-1
	addi $t0, $t0,4
	b do

ndo:
	la $a0, xd
	li $v0, 4
	syscall 
	la $t0, mangso
	move $s1,$s0

do1:
	beq $s1,0,ndo1
	
	lw $t2, ($t0)
	move $a0, $t2
	li $v0, 1
	syscall 
	la $a0, phay
	li $v0, 4
	syscall 
	addi $s1,$s1,-1
	addi $t0, $t0,4
	b do1

ndo1:
	la $a0, xd
	li $v0, 4
	syscall 
	la $t0, mangso
	move $s1,$s0
	addi $t5,$zero,0
	addi $t6,$zero,0
	addi $t4,$zero,0
do2:
	beq $s1,0, ndo2
	
	lw $t2, ($t0)
	move $a0, $t2
	li $v0,1
	syscall
	slt $t4, $t6, $t2
	beq $t4,$zero, LADD
	add $t5,$zero,$t2
	LADD:
	add $t6,$zero,$t2
	addi $s1, $s1,-1
	addi $t0, $t0,4
	b do2

ndo2:
	


	
 