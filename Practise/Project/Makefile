main: factorial.l factorial.y
	bison -d factorial.y
	flex factorial.l
	gcc factorial.tab.c lex.yy.c
	a <input.txt> output.txt