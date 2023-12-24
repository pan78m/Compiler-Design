main: task.l task.y
	bison -d task.y	
	flex task.l	
	gcc task.tab.c lex.yy.c	
	a <input.txt> output.txt