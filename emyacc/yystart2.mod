(*
 * Copyright (c) 1987 Robert R. Henry
 *
 * %Z%%M% %I% %G%
 *)
procedure yyreduce( yym: integer; yypvt: integer; var yyv: yysstack; var yyval: YYSTYPE): integer;
	var	yyreducevalue: integer;
begin
	(*
	 *	3 is magic default value to return indicating that
	 *	the production was OK
	 *)
	yyreducevalue := 3;
	case yym of
