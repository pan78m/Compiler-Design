main: Check_A_Eaual_what.l Check_A_Equal_what.y
	bison -d Check_A_Equal_what.y
	flex Check_A_Equal_what.l
	gcc Check_A_Equal_what.tab.c lex.yy.c
	a <input.txt> output.txt
