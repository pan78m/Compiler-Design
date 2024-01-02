task_2: task_2.l task_2.y
	yacc -d task_2.y	
	lex task_2.l	
	gcc task_2.tab.c lex.yy.c	
	a <input.txt> output.txt