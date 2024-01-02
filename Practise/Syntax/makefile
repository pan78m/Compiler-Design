main: condition_if_check.l condition_if_check.y
	bison -d condition_if_check.y
	flex condition_if_check.l
	gcc condition_if_check.tab.c lex.yy.c
	a <input.txt> output.txt