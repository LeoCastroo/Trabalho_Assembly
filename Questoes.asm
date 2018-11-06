// Matricula 89383 - Repitidos 8 e 3 
//2
addi $t1,$gp, 0
loop1: 
	   beq $t2,2,exit
	   addi $t3,$t1,4
	   addi $t4,$t2,1
loop2:
	   lw $t5,0($t1)
	   lw $t6,0($t3)
 	   beq $t4,3,endloop2
	   bge $t5,$t6,endif
	   add $t7,$zero,$t6
	   addi $t6,$t5, 0
	   add $t5,$zero,$t7
	   sw $t5,0($t1)
	   sw $t6,0($t3)
endif:
	  addi $t3,$t3,4
	  addi $t4,$t4,1
	  jal loop2
endloop2:
	  addi $t1,$t1,4
      addi $t2,$t2,1
      jal loop1
exit:


//3
lw $t1, 0($gp)
lw $t2, 4($gp)
slti $t3, $t1, 0
beq $t3, 1, soma1
soma:
	beq $t1, 0, exit
	add $t6, $t6, $t2
	subi $t1, $t1, 1
	j soma
soma1:
	beq $t1, 0, exit
	sub $t6, $t6, $t2
	addi $t1, $t1, 1
	j soma1
exit:
	sw $t6, 8($gp)
	
	
//5
li $t1,0
addi $t2,$gp,4
loop: 
	lw $t3,0($t2)
	beq $t3,$zero,exit
	add $t1,$t1,$t3
	addi $t2,$t2,4
	jal loop
exit: 
	sw $t1,0($gp)

//8
addi $t2,$gp,0
addi $t3,$gp,32  
addi $t1,$gp,64 
retorna: 
	lw $t5,0($t2)
	lw $t6,0($t3)
	beq $t5,$zero,exit //Compara com zero para sair do loop
	beq $t6,$zero,exit //Compara com zero para sair do loop
	sub $t4,$t5,$t6
	sw $t4,0($t1)
	addi $t1,$t1,4
	addi $t2,$t2,4
	addi $t3,$t3,4
	jal retorna
exit:

//9
li $t1,0
addi $t2,$gp,4  
addi $t3,$gp,32
loop: 
	lw $t4,0($t2)
	lw $t5,0($t3)
	beq $t4,$zero,exit
	beq $t5,$zero,exit
	blt $t4,$t5,aumenta1
aumenta1: 
	addi $t1,$t1,1
	jal continue
continue:
	addi $t2,$t2,4
	addi $t3,$t3,4
	jal loop
exit:
