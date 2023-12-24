task_2: task_2.l task_2.y
	bison -d task_2.y	
	flex task_2.l	
	gcc task_2.tab.c lex.yy.c	
	a <input.txt> output.txt