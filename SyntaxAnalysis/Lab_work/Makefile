task_5_forLoop: task_5_forLoop.l task_5_forLoop.y
	bison -d task_5_forLoop.y	
	flex task_5_forLoop.l	
	gcc task_5_forLoop.tab.c lex.yy.c	
	a <input.txt> output.txt
