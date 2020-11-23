export YYSTYPE, YYLEXTYPE, parsercreator
const YYSTYPE <- Tree
const YYLEXTYPE <- typeobject YYLEXTYPE
operation lex -> [integer, YYSTYPE]
end YYLEXTYPE
const ENVIRON <- typeobject ENVIRON
  operation error[String]
end ENVIRON
	const TEOF <- 0
	const TIDENTIFIER <- 1
	const TOPERATOR <- 2
	const TLPAREN <- 3
	const TRPAREN <- 4
	const TLSQUARE <- 5
	const TRSQUARE <- 6
	const TLCURLY <- 7
	const TRCURLY <- 8
	const TDOLLAR <- 9
	const TDOT <- 10
	const TDOTSTAR <- 11
	const TDOTQUESTION <- 12
	const TCOMMA <- 13
	const TCOLON <- 14
	const TSEMI <- 15
	const TINTEGERLITERAL <- 16
	const TREALLITERAL <- 17
	const TCHARACTERLITERAL <- 18
	const TSTRINGLITERAL <- 19
	const OAND <- 20
	const OASSIGN <- 21
	const OCONFORMSTO <- 22
	const ODIVIDE <- 23
	const OEQUAL <- 24
	const OGREATER <- 25
	const OGREATEREQUAL <- 26
	const OIDENTITY <- 27
	const OLESS <- 28
	const OLESSEQUAL <- 29
	const OMINUS <- 30
	const OMOD <- 31
	const ONEGATE <- 32
	const ONOT <- 33
	const ONOTEQUAL <- 34
	const ONOTIDENTITY <- 35
	const OOR <- 36
	const OPLUS <- 37
	const ORETURNS <- 38
	const OTIMES <- 39
	const KACCEPT <- 40
	const KAND <- 41
	const KAS <- 42
	const KASSERT <- 43
	const KAT <- 44
	const KAWAITING <- 45
	const KATTACHED <- 46
	const KBEGIN <- 47
	const KBUILTIN <- 48
	const KBY <- 49
	const KCHECKPOINT <- 50
	const KCLOSURE <- 51
	const KCODEOF <- 52
	const KCLASS <- 53
	const KCONST <- 54
	const KELSE <- 55
	const KELSEIF <- 56
	const KEND <- 57
	const KENUMERATION <- 58
	const KEXIT <- 59
	const KEXPORT <- 60
	const KEXTERNAL <- 61
	const KFAILURE <- 62
	const KFALSE <- 63
	const KFIELD <- 64
	const KFIX <- 65
	const KFOR <- 66
	const KFORALL <- 67
	const KFROM <- 68
	const KFUNCTION <- 69
	const KIF <- 70
	const KIMMUTABLE <- 71
	const KIN <- 72
	const KINITIALLY <- 73
	const KISFIXED <- 74
	const KISLOCAL <- 75
	const KLOCATE <- 76
	const KLOOP <- 77
	const KMONITOR <- 78
	const KMOVE <- 79
	const KNAMEOF <- 80
	const KNEW <- 81
	const KNIL <- 82
	const KOBJECT <- 83
	const KOP <- 84
	const KOPERATION <- 85
	const KOR <- 86
	const KPRIMITIVE <- 87
	const KPROCESS <- 88
	const KRECORD <- 89
	const KRECOVERY <- 90
	const KREFIX <- 91
	const KRESTRICT <- 92
	const KRETURN <- 93
	const KRETURNANDFAIL <- 94
	const KSELF <- 95
	const KSIGNAL <- 96
	const KSUCHTHAT <- 97
	const KSYNTACTICTYPEOF <- 98
	const KTHEN <- 99
	const KTO <- 100
	const KTRUE <- 101
	const KTYPEOBJECT <- 102
	const KTYPEOF <- 103
	const KUNFIX <- 104
	const KUNAVAILABLE <- 105
	const KVAR <- 106
	const KVIEW <- 107
	const KVISIT <- 108
	const KWAIT <- 109
	const KWELCOMABLE <- 110
	const KWELCOME <- 111
	const KWHEN <- 112
	const KWHILE <- 113
	const KWHERE <- 114
const parsercreator <- immutable object parsercreator
  const parser <- typeobject parser
    operation parse [ yylextype ] -> [integer]
  end parser
  export function getSignature -> [r:signature]
    r <- parser
  end getSignature
  export operation create [environment:ENVIRON] -> [r:parser]
    r <- object aYYParser

% #line 2 "em_ecomp.y" 

% #line 5 "em_ecomp.y" 
  const YYBASE <- 0
  const Token <- integer

% #line 2 "em_ecomp.y" 
%  imports go here

% #line 5 "em_ecomp.y" 

const MYENVT <- typeobject MYENVT
  operation done [yystype]
  operation error [String]
  operation SemanticError [Integer, String, RISA]
  operation errorf [String, RISA]
  operation warningf [String, RISA]
  operation printf [String, RISA]
  function getln -> [Integer]
  operation checknames[yystype, yystype]
  operation checknamesbyid[Ident, Ident]
  function getFileName -> [Tree]
  operation distribute [TreeMaker, Tree, Tree, Tree] -> [Tree]
  operation getITable -> [IdentTable]
  operation newid -> [Integer]
end MYENVT
const env <- view environment as MYENVT

const ERRCODE <- 256
const vi <- vector.of[integer]

const yyexca <- {
~1,1
,0,~1
,~2,0
,~1,244
,311,68
,318,68
,321,68
,363,68
,~2,83
,~1,310
,271,274
,~2,273
,~1,321
,314,116
,319,116
,~2,68
,~1,342
,270,133
,278,133
,~2,135
,~1,454
,314,124
,~2,5
,~1,455
,312,122
,313,122
,314,122
,~2,5
}
const YYNPROD <- 275
const YYLAST <- 2139
const yyact %%2138
 <- {
181,503,327,9,385,47,64,411,227,298,
3,248,371,10,122,151,313,296,40,249,
25,21,17,76,368,18,220,319,96,97,
98,99,100,101,102,103,104,105,106,107,
108,297,265,269,4,222,242,153,190,115,
6,245,180,179,274,152,195,59,155,259,
184,199,45,421,123,16,15,247,13,470,
19,231,13,121,388,374,511,95,130,131,
132,133,134,135,136,137,138,139,140,141,
142,143,144,145,146,147,148,72,93,75,
70,238,448,393,74,373,94,114,11,286,
197,394,231,19,92,230,241,240,116,117,
118,225,372,505,119,506,507,177,434,71,
17,302,510,175,156,73,251,198,509,202,
251,494,285,112,109,110,111,508,70,286,
204,205,158,14,174,170,159,161,163,172,
162,164,168,171,165,166,160,173,157,167,
95,169,497,176,192,193,492,187,72,196,
75,235,280,211,212,74,188,209,210,283,
216,93,282,15,210,491,236,490,91,94,
218,11,221,223,198,90,228,92,238,233,
71,223,206,8,70,475,73,429,426,270,
473,472,471,241,240,461,459,457,238,70,
244,252,221,456,281,453,254,207,208,214,
451,480,258,241,240,450,196,232,243,246,
449,226,478,447,446,479,244,229,413,441,
13,420,200,234,419,418,291,19,403,223,
294,12,237,223,243,408,407,392,383,289,
380,256,377,375,197,364,262,262,309,253,
299,300,301,284,261,261,276,260,260,263,
221,358,314,314,357,292,307,321,356,293,
316,317,363,315,295,311,342,312,251,224,
288,257,244,369,191,219,369,215,379,360,
361,362,382,124,125,126,127,128,129,386,
243,376,185,303,203,395,396,397,398,399,
178,391,404,405,366,8,406,113,189,367,
402,7,365,23,120,415,20,400,58,414,
412,412,57,154,409,46,43,26,30,500,
485,387,401,417,465,410,343,422,390,427,
384,432,381,435,428,123,335,198,423,424,
334,416,333,332,270,331,342,342,330,437,
442,228,436,238,444,433,329,271,443,328,
412,326,445,325,324,323,336,386,241,240,
320,452,273,378,272,460,318,268,267,462,
463,464,266,458,22,279,278,467,277,275,
69,201,466,290,469,66,65,468,474,370,
476,287,216,250,198,198,239,502,68,194,
67,454,455,342,342,217,483,481,24,5,
2,1,0,0,487,488,10,198,0,0,
486,0,493,0,255,0,342,0,0,0,
0,342,477,504,0,198,198,501,342,0,
0,0,0,512,342,342,0,504,0,0,
306,0,337,270,11,0,48,0,0,0,
63,0,238,0,495,496,271,0,0,51,
52,50,49,12,0,304,305,241,240,0,
308,273,0,272,0,0,0,0,0,0,
0,0,0,355,0,359,344,0,0,197,
349,0,0,0,72,0,75,0,0,0,
499,74,341,0,0,0,54,0,346,340,
0,0,0,338,60,264,0,0,270,0,
339,61,345,389,44,56,71,238,0,0,
350,271,73,0,347,0,353,354,55,352,
0,0,241,240,53,70,273,348,272,0,
0,0,351,62,337,95,11,0,48,0,
0,0,63,0,0,0,425,0,0,0,
0,51,52,50,49,89,93,83,85,87,
81,86,88,91,94,0,0,84,82,0,
90,0,92,0,0,355,0,0,344,0,
0,197,349,0,0,0,72,0,75,0,
0,0,498,74,341,0,0,0,54,0,
346,340,0,0,0,338,60,0,0,0,
0,0,339,61,345,0,44,56,71,0,
0,0,350,0,73,0,347,0,353,354,
55,352,0,0,0,0,53,70,337,348,
11,0,48,0,351,62,63,0,0,0,
0,0,0,0,0,51,52,50,49,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,355,
0,0,344,0,0,197,349,0,0,0,
72,0,75,0,0,0,484,74,341,0,
0,0,54,0,346,340,0,0,0,338,
60,0,0,0,0,0,339,61,345,0,
44,56,71,0,0,0,350,0,73,0,
347,0,353,354,55,352,0,0,0,0,
53,70,337,348,11,0,48,0,351,62,
63,0,0,0,0,0,0,0,0,51,
52,50,49,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,355,0,0,344,0,0,197,
349,0,0,0,72,0,75,0,0,0,
431,74,341,0,0,0,54,0,346,340,
0,0,0,338,60,0,0,0,0,0,
339,61,345,0,44,56,71,0,0,0,
350,0,73,0,347,0,353,354,55,352,
0,0,0,0,53,70,337,348,11,0,
48,0,351,62,63,0,0,0,0,0,
0,0,0,51,52,50,49,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,355,0,0,
344,0,0,197,349,0,0,0,72,0,
75,0,0,0,0,74,341,0,0,0,
54,0,346,340,0,0,0,338,60,0,
0,0,0,0,339,61,345,0,44,56,
71,0,0,0,350,0,73,0,347,0,
353,354,55,352,0,0,0,0,53,70,
0,348,322,0,0,0,351,62,337,0,
11,0,48,0,0,0,63,0,0,0,
0,0,0,0,0,51,52,50,49,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,355,
0,0,344,0,0,197,349,0,0,0,
72,0,75,0,0,0,0,74,341,0,
0,0,54,0,346,340,0,0,0,338,
60,0,0,0,0,0,339,61,345,0,
44,56,71,0,0,0,350,0,73,0,
347,0,353,354,55,352,0,0,0,0,
53,70,0,348,0,11,0,48,351,62,
213,63,0,0,0,0,0,0,0,0,
51,52,50,49,0,0,0,0,0,0,
0,0,0,0,42,0,41,27,0,0,
0,0,0,0,0,0,0,0,0,32,
0,0,0,0,0,72,33,75,0,0,
0,0,74,0,0,0,0,54,0,0,
0,0,0,0,0,60,0,0,38,37,
31,0,61,182,34,44,56,71,0,0,
0,0,0,73,0,0,29,0,0,55,
0,0,36,0,0,53,70,35,0,0,
0,28,183,0,62,39,11,0,48,0,
0,0,63,0,0,0,0,0,0,0,
0,51,52,50,49,0,0,0,0,0,
0,0,0,0,0,42,0,41,27,0,
0,0,0,0,0,0,0,0,0,0,
32,0,0,0,0,0,72,33,75,0,
0,0,0,74,0,0,0,0,54,0,
0,0,0,0,0,0,60,0,0,38,
37,31,0,61,182,34,44,56,71,0,
0,0,0,0,73,0,0,29,0,0,
55,0,0,36,0,0,53,70,35,0,
0,0,28,183,0,62,39,11,0,48,
0,0,0,63,0,0,0,0,0,0,
0,0,51,52,50,49,0,0,0,0,
0,0,0,0,0,0,42,0,41,27,
0,0,0,0,0,0,0,0,0,0,
0,32,0,0,0,0,0,72,33,75,
0,0,0,0,74,0,0,0,0,54,
0,0,0,0,0,0,0,60,0,0,
38,37,31,0,61,0,34,44,56,71,
0,0,0,0,0,73,0,0,29,0,
0,55,0,0,36,0,0,53,70,35,
0,0,310,28,48,0,62,39,63,0,
0,0,0,0,0,0,0,51,52,50,
49,0,0,0,0,0,0,0,0,0,
0,42,0,41,27,0,0,0,0,0,
0,0,0,0,0,0,32,0,0,0,
0,0,72,33,75,0,0,0,0,74,
0,0,0,0,54,0,0,0,0,0,
0,0,60,0,0,38,37,31,0,61,
0,34,44,56,71,0,0,0,0,0,
73,0,0,29,0,0,55,0,0,36,
0,0,53,70,35,0,0,11,28,48,
0,62,39,63,0,0,0,0,0,0,
0,0,51,52,50,49,0,0,0,11,
0,48,0,0,0,63,0,0,0,0,
0,0,0,0,51,52,50,49,0,0,
0,0,0,0,0,0,0,72,0,75,
0,0,0,0,74,0,0,0,0,54,
0,0,0,0,0,0,0,60,0,72,
0,75,0,0,61,0,74,44,56,71,
0,54,0,0,0,73,0,0,0,60,
0,55,0,0,0,0,61,53,70,0,
56,71,0,0,0,0,62,73,0,95,
0,0,0,55,0,0,0,0,0,53,
70,0,0,0,0,0,0,79,62,89,
93,83,85,87,81,86,88,91,94,95,
0,84,82,77,90,0,92,0,80,0,
0,0,0,0,0,0,0,79,0,89,
93,83,85,87,81,86,88,91,94,0,
0,84,82,77,90,0,92,95,80,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,78,0,79,0,89,93,83,
85,87,81,86,88,91,94,438,0,84,
82,77,90,0,92,0,80,0,95,0,
0,0,0,78,0,0,0,0,0,0,
0,0,0,0,0,0,79,150,89,93,
83,85,87,81,86,88,91,94,0,0,
84,82,77,90,0,92,0,80,95,0,
0,78,0,0,0,489,0,0,0,0,
482,0,0,0,430,0,79,0,89,93,
83,85,87,81,86,88,91,94,95,0,
84,82,77,90,0,92,0,80,0,0,
0,0,78,0,0,0,79,0,89,93,
83,85,87,81,86,88,91,94,0,0,
84,82,77,90,0,92,95,80,0,0,
440,0,0,0,0,0,0,0,0,0,
0,0,78,0,79,0,89,93,83,85,
87,81,86,88,91,94,0,0,84,82,
77,90,95,92,186,80,0,0,439,0,
0,0,78,0,0,0,0,0,0,0,
79,0,89,93,83,85,87,81,86,88,
91,94,0,95,84,82,77,90,0,92,
0,80,0,0,0,0,0,0,0,0,
78,79,0,89,93,83,85,87,81,86,
88,91,94,0,0,84,82,77,90,95,
92,0,80,149,0,0,0,0,0,0,
0,0,0,0,0,0,78,79,0,89,
93,83,85,87,81,86,88,91,94,0,
95,84,82,77,90,0,92,0,80,0,
0,0,0,0,0,0,0,78,79,0,
89,93,83,85,87,81,86,88,91,94,
0,0,84,82,0,90,0,92,0,80,
175,156,0,0,0,0,0,0,0,0,
0,0,0,78,0,0,0,0,0,158,
0,0,170,159,161,163,0,162,164,168,
171,165,166,160,0,157,167,0,169
}
const yypact %%512
 <- {
~1000,~1000,44,~1000,~1000,~1000,~1000,~57,2,~204,
~1000,~1000,~4,~1000,90,~57,85,~1000,~1000,1129,
~1000,~1000,1129,~1000,~1000,1770,~1000,1129,1129,1129,
1129,1129,1129,1129,1129,1129,1129,1129,1129,1129,
~123,~1000,~1000,95,1361,~1000,~1000,~1000,1129,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~130,~130,~211,1129,~1000,~1000,~1000,~1000,~1000,~1000,
2,2,2,2,2,2,1770,1129,1129,1129,
1129,1129,1129,1129,1129,1129,1129,1129,1129,1129,
1129,1129,1129,1129,1129,1129,376,1734,1480,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,1770,~125,
1361,~125,92,1018,80,1703,~1000,~1000,~1000,~130,
~4,~1000,88,1770,19,19,19,~19,2,84,
1801,1801,376,376,~89,~89,~89,~89,~89,~89,
~89,~89,~89,~182,~182,~1000,~1000,~1000,~1000,1129,
1129,80,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,80,80,~1000,~76,
~1000,1770,1129,1129,~1000,907,~1000,~1000,62,1129,
~1000,52,~1000,57,~193,~1000,~106,~1000,~1000,~199,
~1000,57,~1000,~57,1770,1770,~1000,~1000,~1000,~1000,
1018,1770,1770,~1000,~82,~1000,1770,~118,~1000,~1000,
~19,~1000,~1000,~1000,~196,~57,~1000,2,~1000,~1000,
~57,2,19,60,~1000,~1000,~57,~1000,1842,1842,
~1000,~1000,281,~1000,~1000,~129,~19,~1000,~121,~1000,
17,~1000,~1000,~158,~1000,~1000,~1000,~1000,~1000,57,
~1000,~1000,~1000,57,~57,~1000,~1000,~1000,~1000,~1000,
~225,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~190,2,2,2,206,~1000,~18,1234,~1000,~1000,
5,~1000,18,18,~1000,~1000,~3,690,~1000,~6,
~10,~13,2,~158,~4,~4,~57,~1000,14,1770,
~1000,~98,~19,~249,~1000,21,~249,~48,~39,~1000,
~1000,~1000,16,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,1129,~1000,
~186,~92,~123,~167,1129,1129,1129,1129,1129,~1000,
~84,1129,1129,~1000,~1000,1129,~71,~70,~125,~4,
~20,~20,~1000,~1000,1129,~1000,~1000,87,~1000,~1000,
~249,~1000,7,6,3,~200,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,2,~95,~1000,1518,586,1339,~201,
~1000,~1000,1129,1339,1129,1770,1450,1667,1629,1770,
~55,~106,~1000,~1000,1770,1770,1770,~1000,~1000,~1000,
~20,~1000,~1000,1129,~1000,1770,~57,~1000,~24,~26,
~1000,~1000,~161,~64,~69,~23,1129,~79,~1000,~1000,
~1000,~101,~44,~52,1129,1770,~123,~45,1129,1129,
1129,~1000,~1000,~1000,1770,~1000,1129,~259,~1000,~97,
~141,~1000,~1000,~107,802,802,~1000,1129,~155,1129,
1770,1129,1770,1770,1770,~21,~1000,1770,~1000,~1000,
~145,~1000,~1000,~1000,1599,1129,1770,482,~1000,~1000,
~57,~1000,1339,1559,~126,~68,~1000,~77,~85,1339,
~1000,~137,~1000,~1000,~90,378,266,~150,~176,~185,
~131,~1000,~194,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~150,~1000
}
const yypgo %%105
 <- {
0,481,480,9,479,50,3,65,25,478,
0,6,262,48,475,5,470,469,56,51,
8,61,468,1,467,54,59,45,16,24,
466,11,19,463,461,459,12,457,456,26,
46,455,453,42,451,450,27,449,448,446,
445,444,7,443,442,438,437,43,17,15,
41,436,433,430,426,425,424,423,421,2,
419,416,408,405,403,402,400,396,392,390,
4,389,388,386,18,14,384,382,380,379,
378,377,376,62,60,53,375,58,55,47,
373,52,372,368,364,57
}
const yyr1 %%274
 <- {
0,1,2,2,2,3,4,4,7,7,
8,9,11,16,17,17,18,22,21,21,
6,6,23,23,23,23,24,24,14,14,
25,25,30,30,27,27,27,31,31,33,
33,34,34,32,32,28,28,28,29,29,
35,35,36,36,36,13,13,38,41,42,
42,42,44,44,45,39,39,19,19,46,
47,47,47,47,51,49,49,5,50,52,
52,53,48,40,40,40,40,40,43,43,
57,58,54,55,56,60,60,60,64,63,
63,63,63,63,63,63,63,63,63,63,
63,63,63,63,78,78,61,61,62,62,
79,79,80,81,81,65,67,67,67,66,
68,82,82,83,83,69,69,70,71,71,
71,71,72,76,77,86,86,86,87,87,
20,20,73,88,88,89,89,74,75,85,
85,90,90,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,91,84,84,84,
84,84,92,92,92,92,92,92,92,93,
93,93,26,26,26,98,97,99,99,99,
99,99,99,99,99,99,99,99,99,99,
99,99,100,100,100,59,59,59,59,94,
94,95,95,101,101,101,96,96,96,96,
96,96,96,96,96,96,103,104,104,104,
37,37,102,102,102,102,102,105,105,105,
105,105,105,15,12
}
const yyr2 %%274
 <- {
0,2,1,2,2,0,4,2,1,1,
2,1,6,5,1,2,4,5,1,3,
1,3,1,1,1,1,1,3,1,2,
5,5,1,1,1,2,3,1,3,1,
0,1,0,5,3,1,3,4,1,1,
1,2,4,4,2,0,2,7,8,1,
3,3,1,3,10,1,2,1,1,2,
1,1,1,1,1,4,5,5,3,1,
2,2,4,1,2,2,2,2,1,2,
4,3,4,4,4,1,2,2,2,1,
1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,3,1,5,1,4,
1,3,3,1,2,5,11,11,7,4,
2,1,2,1,3,1,3,2,4,4,
4,2,3,1,1,1,2,2,1,1,
1,1,11,1,1,1,1,2,2,1,
3,1,1,1,3,3,3,3,2,3,
3,3,3,3,3,3,3,3,4,4,
3,3,3,3,3,3,2,2,2,2,
2,2,2,2,2,2,1,1,2,3,
3,3,1,3,4,3,4,4,4,1,
1,3,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,2,
3,1,3,1,2,2,1,1,1,1,
1,1,1,1,1,1,4,1,1,2,
1,2,1,2,2,2,3,1,1,1,
1,1,1,1,1
}
const yychk %%512
 <- {
~1000,~1,~2,~3,0,~4,~5,317,311,~6,
~15,258,~12,258,357,270,~7,~3,~8,271,
276,~15,~51,278,~9,~10,~91,290,364,349,
~90,333,302,309,337,360,355,332,331,368,
~84,289,287,~92,338,~93,~96,~15,260,276,
275,273,274,358,320,352,339,~102,~103,~105,
328,335,367,264,~11,~38,~41,~16,~22,~45,
359,340,308,346,315,310,~10,293,343,277,
298,284,292,281,291,282,285,283,286,279,
294,287,296,280,288,259,~10,~10,~10,~10,
~10,~10,~10,~10,~10,~10,~10,~10,~10,267,
268,269,266,262,~93,~10,~105,~105,~105,335,
~104,~3,~85,~10,~12,~12,~12,~12,~12,~12,
~10,~10,~10,~10,~10,~10,~10,~10,~10,~10,
~10,~10,~10,~10,~10,~10,~10,~10,~10,299,
357,~59,~98,~99,~100,~97,259,293,277,281,
291,282,285,283,286,289,290,294,287,296,
280,288,284,292,279,258,~93,~59,258,~95,
~101,~10,336,365,~94,262,261,~105,~7,270,
~13,305,~13,~13,~17,~18,~19,303,~3,~21,
~12,~44,~3,260,~10,~10,~94,~94,~94,263,
270,~10,~10,263,~95,265,~10,~14,~3,273,
~39,~3,~27,~3,262,314,~18,~20,~3,363,
314,270,~27,~15,~101,263,314,~25,326,~30,
342,341,~40,~46,~3,~19,~39,263,~31,~32,
~33,336,~15,~21,~15,~12,~13,261,~15,~26,
~97,~98,~99,~26,314,~43,~54,~55,~56,~57,
317,330,347,345,~25,~47,~5,~48,~49,~50,
311,363,321,318,~40,263,270,~34,303,~8,
~42,~3,~27,~27,~15,~57,~58,~60,~3,~58,
~58,~58,321,~21,~12,~12,314,~32,~12,~10,
258,310,~39,~28,~3,295,~28,314,~61,~46,
~63,~3,362,~65,~66,~67,~68,~69,~70,~71,
~72,~73,~74,~75,~76,~77,~64,256,327,334,
323,316,~84,~83,300,336,322,348,361,304,
344,366,353,350,351,297,314,314,314,~12,
~8,~8,~8,~15,271,~5,~43,~40,~29,~3,
~35,~36,371,354,324,262,~29,330,~62,~3,
319,~78,~3,262,~79,~80,~10,~60,260,~12,
~82,~3,369,270,278,~10,~10,~10,~10,~10,
~58,~87,~3,352,~10,~10,~10,347,345,~59,
~8,~52,~3,278,~52,~10,314,~36,258,258,
258,263,~31,~58,~58,~12,313,~81,~3,312,
356,314,~69,~8,329,~10,~84,~85,357,301,
301,314,~20,~52,~10,~15,278,279,263,314,
314,263,~80,314,~60,~60,334,271,~53,278,
~10,270,~10,~10,~10,~86,~3,~10,~37,~11,
328,319,362,327,~10,370,~10,~60,273,276,
262,~11,271,~10,314,~88,~3,~6,~69,306,
323,263,261,~69,278,~60,~60,262,314,314,
~89,~3,~24,~23,~15,273,275,276,323,323,
263,270,~23
}
const yydef %%512
 <- {
5,~2,0,2,1,3,4,0,0,7,
20,273,5,274,0,0,0,8,9,0,
6,21,0,74,10,11,163,0,0,0,
0,0,0,0,0,0,0,0,0,0,
196,161,162,197,0,202,209,210,0,246,
247,248,249,250,251,252,253,254,255,262,
0,0,0,5,267,268,269,270,271,272,
0,0,0,0,0,0,77,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,168,0,0,186,
187,188,189,190,191,192,193,194,195,0,
0,0,0,0,198,0,263,264,265,0,
5,257,258,159,55,55,55,5,0,5,
164,165,166,167,169,170,171,172,173,174,
175,176,177,180,181,182,183,184,185,0,
0,199,235,236,237,238,215,217,218,219,
220,221,222,223,224,225,226,227,228,229,
230,231,232,233,234,216,200,201,205,0,
241,243,0,0,203,0,211,266,0,259,
5,0,5,5,5,14,5,67,68,0,
18,5,62,0,178,179,206,207,208,204,
0,244,245,239,0,256,160,0,28,56,
5,65,5,34,40,0,15,0,150,151,
0,0,55,0,242,240,0,29,0,0,
32,33,0,66,~2,0,5,35,0,37,
42,39,13,0,17,19,5,63,12,5,
212,213,214,5,0,84,85,86,87,88,
0,5,5,5,5,69,70,71,72,73,
0,0,0,0,0,36,40,0,41,16,
5,59,5,5,57,89,0,5,95,0,
0,0,0,0,0,0,0,38,0,44,
~2,0,5,5,45,0,5,0,5,96,
97,~2,5,99,100,101,102,103,104,105,
106,107,108,109,110,111,112,113,0,5,
0,5,~2,0,0,0,0,0,0,5,
5,0,0,143,144,0,0,0,0,0,
5,5,78,58,0,60,61,0,30,48,
49,50,0,0,0,40,31,92,91,118,
5,5,114,0,5,120,0,5,0,0,
130,131,0,0,0,137,0,0,0,141,
0,5,148,149,157,158,98,93,94,90,
5,82,79,0,75,43,0,51,0,0,
54,46,0,0,0,0,0,0,123,5,
5,0,0,0,0,132,134,136,0,0,
0,142,5,76,80,64,0,0,47,0,
0,115,121,0,~2,~2,129,0,0,0,
5,0,138,139,140,0,145,52,53,260,
0,119,117,125,0,0,81,5,146,147,
5,261,0,0,0,0,153,154,0,0,
128,0,5,5,0,5,5,5,0,0,
0,155,156,26,22,23,24,25,126,127,
152,0,27
}
% yacc parser for emerald
  
const yyflag : integer <- ~1000
const yymaxdepth <- 150

var yyv:	 vector.of[YYSTYPE] <-
                 vector.of[YYSTYPE].create [YYMAXDEPTH+1]
var yychar:	 integer
var yynerrs:	 integer
var yyerrflag:   integer
var yylval:      YYSTYPE
var yyval:       YYSTYPE

operation yyclearin
   yychar <- ~1
end yyclearin

operation yyerrok
   yyerrflag <- 0
end yyerrok

%
%	parser for yacc output
%
export operation parse[lex : YYLEXTYPE] ->
	[yyparsevalue : integer]

const yys <-  vi.create[YYMAXDEPTH+2]

var yyj:      integer
var yym:      integer
var yypvt:    integer
var yystate:  integer
var yyps:     integer
var yyn:      integer
var yypv:     integer
var yyxi:     integer
var bozo:     integer
var newstate: boolean	% hack ld
var error:    boolean	% hack ld
var i :       Integer
yystate   <-	0
yychar    <-	~1
yynerrs   <-	0
yyerrflag <-	0
yyps      <-	~1
yypv      <-	~1
newstate  <-	false	% new state true => goto newstate:
error     <-	false	% error =  true  => goto errlab:

loop
	loop
%   yystack:   put a state and value onto the stack
%		xx.printf["\nyystack: (yystate %d)\n",
%					{ yystate }]

		if !error then

			if !newstate then
				yyps <- yyps + 1
				if yyps>yymaxdepth then
					environment.error["yacc stack overflow"]
					yyparsevalue <- 1
					return
				end if
				yys[yyps] <- yystate
				yypv <- yypv + 1
				yyv[yypv] <- yyval

%				xx.printf["\nyyps %d\n\tindex\tval\n",{yyps}]
%				for (i <- yyps : i >= 0: i <- i - 1)
%					xx.printf["\t%d\t%d\n", {i, yys[i]}]
%				end for

			end if

%  yynewstate:
			newstate <- false

			yyn <- yypact[yystate]
%			xx.printf["yynewstate: (yyn <- %d)\n",{yyn}]

			if (yyn > yyflag) then
				if yychar < 0 then
					yychar, yylval <- lex.lex
					if yychar < 0 then
						yychar <- 0
					end if
				end if
				yyn <- yyn + yychar
				if (yyn >= 0) and (yyn < yylast) then
					yyn <- yyact[yyn]
					if yyn >= 0 and yychk[yyn] == yychar then % valid shift
						yychar  <- ~1
						yyval   <- yylval
						yystate <- yyn
						if yyerrflag > 0 then
							yyerrflag <- yyerrflag - 1
						end if

%			xx.printf["\tshift: yystate %d, yyval.int %d\n",
%				  {yystate, yyval$IntVal}]

						exit  % goto yystack
					end if
				end if
			end if

% yydefault:  default state action %

			 yyn <- yydef[yystate]
%			 xx.printf["yydefault: (yyn <- %d)\n",{yyn}]
			 if yyn == ~2 then
				if yychar < 0 then
					yychar, yylval <- lex.lex
					if yychar < 0 then
						yychar <- 0
					end if
				end if
%
%		look through exception table
%
				yyxi <- 0
				loop
				      exit when (yyexca[yyxi] == ~1) and (yyexca[yyxi+1] == yystate)
				      yyxi <- yyxi + 2
				end loop

				yyxi <- yyxi + 2
				loop
					exit when (yyexca[yyxi] < 0) or (yyexca[yyxi] == yychar)
					yyxi <- yyxi + 2
				end loop

	    			yyn <- yyexca[yyxi+1]
				if yyn < 0 then
					yyparsevalue <- 0
					return
				end if  % accept
			end if

		end if % error hack

		if ((yyn == 0) or error) then % error...attempt to resume parsing

			if error then
				yyerrflag <- 1
			 end if

			if 0 <= yyerrflag and yyerrflag <= 2 then
				if yyerrflag == 0 then % brand new error
					environment.error["syntax error"]
					yynerrs <- yynerrs + 1
				end if
% errlab:
%				xx.printf["errlab:\n", nil]
				if error then
					error <- false
					yynerrs <- yynerrs + 1
				end if
%
%		incompletely recovered error ... try again
%
				yyerrflag <- 3

%		find a state where "error" is a legal shift action %

				loop
					exit when yyps < 0
					yyn <- yypact[yys[yyps]] + errcode
					if (yyn>=0) and
					   (yyn<yylast) and
					   (yychk[yyact[yyn]] == errcode)
					then
						yystate <- yyact[yyn]  % simulate a shift of "error"
						exit % goto yystack
					end if
					yyn <- yypact[yys[yyps]]

%			the current yyps has no shift on "error", pop stack

					yyps <- yyps - 1
					yypv <- yypv - 1
				end loop
%
%		there is no state on the stack with an error shift ... abort
%
				yyparsevalue <- 1
				return

			elseif yyerrflag == 3 then % no shift yet clobber input char
	    
				if yychar == 0 then
					yyparsevalue <- 1
					return % don't discard eof, quit
				end if
				yychar	 <- ~1
				newstate <- true % goto yynewstate try again in the same state
				exit
			 end if
		end if
%
%	reduction by production yyn
%
%		xx.printf["\treducing by production (yyn %d)\n",{ yyn }]
		yyps  <- yyps - yyr2[yyn]
		yypvt <- yypv
		yypv  <- yypv - yyr2[yyn]
		yyval <- yyv[yypv+1]
		yym   <- yyn
%
%	consult goto table to find next state
%
		yyn <- yyr1[yyn]
		yyj <- yypgo[yyn] + yys[yyps] + 1

%		xx.printf["\tnew yyn <- %d yields yyj <- %d\n",{yyn, yyj}]

		if (yyj >= yylast) then
			yystate <- yyact[yypgo[yyn]]
		else
			yystate <- yyact[yyj]
			if (yystate >= 0 and yychk[yystate] != ~yyn) then
				yystate <- yyact[yypgo[yyn]]
			end if
		end if
  	        bozo, yyval <- self.yyreduce[yym, yypvt]
	        if bozo == ~1 then
			yyparsevalue <- 1
			return		% yyabort
		elseif bozo == 0 then
			yyparsevalue <- 0
			return		% yyaccept
		elseif bozo == 1 then
			error <- true	% yyerror
		end if
	end loop
end loop  % goto yystack   stack new state and value
end parse


operation yyreduce[ yym:integer, yypvt: integer] ->
        [yyreducevalue: integer, yyval:YYSTYPE]
        %
        %   3 is magic default value to return
        %   indicating that the production was OK
        %
        yyreducevalue <- 3

        if yym =   1 then 
% #line 151 "em_ecomp.y" 
 yyval <- comp.create[env$ln - 1, env$fileName, nil, nil, yyv[yypvt-1]] env.done[yyval] 

	elseif yym =  2 then 
% #line 155 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  3 then 
% #line 157 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  4 then 
% #line 159 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  5 then 
% #line 162 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  6 then 
% #line 166 "em_ecomp.y" 
 yyval <- xexport.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  7 then 
% #line 169 "em_ecomp.y" 
 yyval <- xexport.create[env$ln, yyv[yypvt-0], nil] 

	elseif yym =  8 then 
% #line 172 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  9 then 
% #line 173 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  10 then 
% #line 177 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  11 then 
% #line 180 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  12 then 
% #line 184 "em_ecomp.y" 
 const a : ATLit <- atlit.create[env$ln, env$fileName, yyv[yypvt-4], yyv[yypvt-2] ]
		  env.checkNames[yyv[yypvt-4], yyv[yypvt-0]]
		  yyval <- a
		  if yyv[yypvt-3] !== nil then
		    a.setBuiltinID[yyv[yypvt-3]]
		  end if 

	elseif yym =  13 then 
% #line 193 "em_ecomp.y" 
 env.checkNames[yyv[yypvt-3], yyv[yypvt-0]]
	      yyval <- recordlit.create[env$ln, env$fileName, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  14 then 
% #line 198 "em_ecomp.y" 
 yyval <- seq.create[env$ln] yyval.rappend[yyv[yypvt-0]] 

	elseif yym =  15 then 
% #line 200 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rappend[yyv[yypvt-0]] 

	elseif yym =  16 then 
% #line 204 "em_ecomp.y" 

		const s <- env.distribute[vardecl, yyv[yypvt-1], yyv[yypvt-0], nil]
		if yyv[yypvt-3] !== nil then
		  if s$isseq then
		    const limit <- s.upperbound
		    for i : Integer <- s.lowerbound while i <= limit by i<-i+1
		      const x <- s[i]
% If doing move/visit
		      const y <- view x as Attachable
		      y$isAttached <- TRUE
		    end for
		  else
% If doing move/visit
		    const y <- view s as Attachable
		    y$isAttached <- TRUE
		  end if
		end if
		yyval <- s
	      

	elseif yym =  17 then 
% #line 226 "em_ecomp.y" 

		  env.checkNames[yyv[yypvt-3], yyv[yypvt-0]]
		  yyval <- enumlit.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]]
		

	elseif yym =  18 then 
% #line 233 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  19 then 
% #line 235 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  20 then 
% #line 239 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  21 then 
% #line 241 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  22 then 
% #line 245 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  23 then 
% #line 247 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  24 then 
% #line 249 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  25 then 
% #line 251 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  26 then 
% #line 255 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  27 then 
% #line 257 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  28 then 
% #line 261 "em_ecomp.y" 
 yyval <- seq.create[env$ln] 

	elseif yym =  29 then 
% #line 263 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] newid.reset 

	elseif yym =  30 then 
% #line 267 "em_ecomp.y" 
 const x : OpSig <- opsig.create[env$ln, (view yyv[yypvt-3] as hasIdent)$id, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]]
		  x$isFunction <- true
		  yyval <- x
		

	elseif yym =  31 then 
% #line 273 "em_ecomp.y" 
 yyval <- opsig.create[env$ln, (view yyv[yypvt-3] as hasIdent)$id, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  32 then 

	elseif yym =  33 then 

	elseif yym =  34 then 
% #line 280 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  35 then 
% #line 282 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  36 then 
% #line 284 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  37 then 
% #line 288 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  38 then 
% #line 290 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  39 then 

	elseif yym =  40 then 

	elseif yym =  41 then 

	elseif yym =  42 then 

	elseif yym =  43 then 
% #line 302 "em_ecomp.y" 

		  const p : Param <- param.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]]
% If doing move/visit
%		  p$isMove <- yyv[yypvt-4] !== nil
		  if yyv[yypvt-3] !== nil then p$isAttached <- true end if
		  yyval <- p
		

	elseif yym =  44 then 
% #line 310 "em_ecomp.y" 

  		  const id <- newid.newid
		  const asym : Sym <- sym.create[env$ln, id]
		  const p : Param <- param.create[env$ln, asym, yyv[yypvt-0]]
% If doing move/visit
%		  p$isMove <- yyv[yypvt-2] !== nil
		  if yyv[yypvt-1] !== nil then p$isAttached <- true end if
		  yyval <- p
		

	elseif yym =  45 then 
% #line 321 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  46 then 
% #line 323 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  47 then 
% #line 325 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  48 then 
% #line 328 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  49 then 
% #line 330 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  50 then 
% #line 334 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  51 then 
% #line 336 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  52 then 
% #line 340 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-2], 1, yyv[yypvt-0]] 

	elseif yym =  53 then 
% #line 342 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-2], 2, yyv[yypvt-0]] 

	elseif yym =  54 then 
% #line 344 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-0], 3, nil] 

	elseif yym =  55 then 
% #line 347 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  56 then 
% #line 349 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  57 then 
% #line 353 "em_ecomp.y" 
 const x : Oblit <- oblit.create[env$ln, env$fileName, yyv[yypvt-5], yyv[yypvt-3], yyv[yypvt-2]]
		  env.checkNames[yyv[yypvt-5], yyv[yypvt-0]]
		  if yyv[yypvt-4] !== nil then
		    x.setBuiltinID[yyv[yypvt-4]]
		  end if
		  yyval <- x 

	elseif yym =  58 then 
% #line 362 "em_ecomp.y" 
 const x : Oblit <- oblit.create[env$ln,env$fileName, yyv[yypvt-6], yyv[yypvt-3], yyv[yypvt-2]]

		  % solve the setq problem.  Each of the symbols in the
		  % parameter clause needs to be turned into a setq with an
		  % undefined outer.  Hmmmm.....
		  % Nope.  We need another thing for explicit parameters,
		  % cause they need types.

		  x$xparam <- yyv[yypvt-4]

		  x$generateOnlyCT <- true
		  env.checkNames[yyv[yypvt-6], yyv[yypvt-0]]
		  if yyv[yypvt-5] !== nil then
		    x.setBuiltinID[yyv[yypvt-5]]
		  end if
		  yyval <- x 

	elseif yym =  59 then 
% #line 381 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  60 then 
% #line 383 "em_ecomp.y" 
 if yyv[yypvt-2] == nil then yyval <- seq.pair[seq.singleton[yyv[yypvt-0]], seq.create[env$ln]] else yyval <- yyv[yypvt-2] yyval[0].rcons[yyv[yypvt-0]] end if 

	elseif yym =  61 then 
% #line 386 "em_ecomp.y" 
 if yyv[yypvt-2] == nil then yyval <- seq.pair[seq.create[env$ln], seq.singleton[yyv[yypvt-0]]] else yyval <- yyv[yypvt-2] yyval[1].rcons[yyv[yypvt-0]] end if 

	elseif yym =  62 then 
% #line 389 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  63 then 
% #line 391 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  64 then 
% #line 395 "em_ecomp.y" 

		  env.checkNames[yyv[yypvt-8], yyv[yypvt-0]]
		  const c <- xclass.create[env$ln, env$fileName, yyv[yypvt-8], yyv[yypvt-7], yyv[yypvt-6], yyv[yypvt-4], yyv[yypvt-3], yyv[yypvt-2]]
		  if yyv[yypvt-5] !== nil then c.setbuiltinid[yyv[yypvt-5]] end if
		  yyval <- c
		

	elseif yym =  65 then 
% #line 404 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  66 then 
% #line 406 "em_ecomp.y" 
 if yyv[yypvt-1] == nil then yyval <- sseq.singleton[yyv[yypvt-0]] else yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] end if 

	elseif yym =  67 then 
% #line 410 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  68 then 
% #line 411 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  69 then 
% #line 415 "em_ecomp.y" 

		if yyv[yypvt-1] !== nil then
		  const s : Tree <- yyv[yypvt-0]
		  if s$isseq then
		    const limit <- s.upperbound
		    for i : Integer <- s.lowerbound while i <= limit by i <- i+1
		      const x : Tree <- s[i]
% If doing move/visit
		      const t <- view x as Attachable
		      t$isattached <- true
		    end for
		  else
% If doing move/visit
		    const t <- view s as Attachable
		    t$isAttached <- true
		  end if
		end if
		yyval <- yyv[yypvt-0]
	      

	elseif yym =  70 then 
% #line 436 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  71 then 
% #line 437 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  72 then 
% #line 438 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  73 then 
% #line 439 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  74 then 

	elseif yym =  75 then 
% #line 446 "em_ecomp.y" 
 yyval <- fielddecl.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  76 then 
% #line 448 "em_ecomp.y" 
 const f : FieldDecl <- fielddecl.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]]
		  f$isConst <- true
		  yyval <- f 

	elseif yym =  77 then 
% #line 454 "em_ecomp.y" 
 yyval <- constdecl.create[env$ln, yyv[yypvt-3], yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  78 then 
% #line 458 "em_ecomp.y" 
 yyval <- extdecl.create[env$ln, yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  79 then 
% #line 461 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  80 then 
% #line 463 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  81 then 
% #line 467 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  82 then 
% #line 471 "em_ecomp.y" 
 yyval <- env.distribute[vardecl, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  83 then 
% #line 475 "em_ecomp.y" 
 yyval <- seq.create[env$ln]
		  yyval.rcons[nil] yyval.rcons[nil] yyval.rcons[nil] 

	elseif yym =  84 then 
% #line 478 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  85 then 
% #line 480 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[0] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one initially definition is allowed", nil]
		  else
		    yyval.setElement[0, yyv[yypvt-0]]
		  end if
		

	elseif yym =  86 then 
% #line 488 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[1] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one recovery definition is allowed", nil]
		  else
		    yyval.setElement[1, yyv[yypvt-0]]
		  end if
		

	elseif yym =  87 then 
% #line 496 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[2] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one process definition is allowed", nil]
		  else
		    yyval.setElement[2, yyv[yypvt-0]]
		  end if
		

	elseif yym =  88 then 
% #line 506 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  89 then 
% #line 508 "em_ecomp.y" 
 (view yyv[yypvt-0] as OpDef)$isExported <- true yyval <- yyv[yypvt-0] 

	elseif yym =  90 then 
% #line 512 "em_ecomp.y" 
 const sig <- view yyv[yypvt-3] as OpSig
		  env.checkNamesByID[sig$name, (view yyv[yypvt-0] as hasIdent)$id]
		  sig.isInDefinition
		  yyval <- opdef.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  91 then 
% #line 519 "em_ecomp.y" 
 yyval <- block.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  92 then 
% #line 523 "em_ecomp.y" 
 yyval <- initdef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  93 then 
% #line 527 "em_ecomp.y" 
 yyval <- recoverydef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  94 then 
% #line 531 "em_ecomp.y" 
 yyval <- processdef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  95 then 
% #line 535 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  96 then 
% #line 537 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  97 then 
% #line 539 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  98 then 
% #line 543 "em_ecomp.y" 
 yyval <- acceptstat.create[env$ln, yyv[yypvt-0] ] 

	elseif yym =  99 then 
% #line 546 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  100 then 
% #line 547 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  101 then 
% #line 548 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  102 then 
% #line 549 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  103 then 
% #line 550 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  104 then 
% #line 551 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  105 then 
% #line 552 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  106 then 
% #line 553 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  107 then 
% #line 554 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  108 then 
% #line 555 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  109 then 
% #line 556 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  110 then 
% #line 557 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  111 then 
% #line 558 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  112 then 
% #line 559 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  113 then 

	elseif yym =  114 then 
% #line 563 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  115 then 
% #line 565 "em_ecomp.y" 
 yyval <- vardecl.create[env$ln, yyv[yypvt-1], sym.create[env$ln, env$itable.Lookup["any", 999]], nil] 

	elseif yym =  116 then 
% #line 568 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  117 then 
% #line 570 "em_ecomp.y" 
 yyval <- xunavail.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  118 then 
% #line 573 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  119 then 
% #line 575 "em_ecomp.y" 
 yyval <- xfailure.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  120 then 
% #line 579 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  121 then 
% #line 581 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  122 then 
% #line 585 "em_ecomp.y" 
 yyval <- ifclause.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  123 then 
% #line 588 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  124 then 
% #line 590 "em_ecomp.y" 
 yyval <- elseclause.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  125 then 
% #line 594 "em_ecomp.y" 
 yyval <- ifstat.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  126 then 
% #line 598 "em_ecomp.y" 
 const inv : Invoc <- invoc.create[env$ln, yyv[yypvt-6], opname.literal["!"], nil]
		  const ex : ExitStat <- exitstat.create[env$ln, inv]
		  var s : Tree <- sseq.create[env$ln]
		  var l : Tree
		  s.rcons[ex]
		  s.rcons[block.create[env$ln, yyv[yypvt-2], nil, nil]]
		  s.rcons[yyv[yypvt-4]]
		  l <- loopstat.create[env$ln, s]
		  s <- sseq.create[env$ln]
		  s.rcons[yyv[yypvt-8]]
		  s.rcons[l]
		  yyval <- block.create[env$ln, s, nil, nil] 

	elseif yym =  127 then 
% #line 611 "em_ecomp.y" 
 const inv : Invoc <- invoc.create[env$ln, yyv[yypvt-5], opname.literal["!"], nil]
		  const ex : ExitStat <- exitstat.create[env$ln, inv]
		  var s : Tree <- sseq.create[env$ln]
		  var l : Tree
		  s.rcons[ex]
		  s.rcons[block.create[env$ln, yyv[yypvt-2], nil, nil]]
		  s.rcons[yyv[yypvt-3]]
		  l <- loopstat.create[env$ln, s]
		  s <- sseq.create[env$ln]
		  s.rcons[vardecl.create[env$ln, yyv[yypvt-9], yyv[yypvt-8], yyv[yypvt-7]]]
		  s.rcons[l]
		  yyval <- block.create[env$ln, s, nil, nil] 

	elseif yym =  128 then 
% #line 624 "em_ecomp.y" 

		  const id <- env$itable.Lookup["i" || env.newid.asString, 999]
		  const lb <- env$itable.Lookup["lb" || env.newid.asString, 999]
		  const ub <- env$itable.Lookup["ub" || env.newid.asString, 999]
		  const col <- env$itable.Lookup["col" || env.newid.asString, 999]
		  const int <- env$itable.Lookup["integer", 999]

		  const colconst <- constdecl.create[env$ln, sym.create[env$ln, col], nil, yyv[yypvt-3]]
		  const lbconst <- constdecl.create[env$ln, sym.create[env$ln, lb], nil,
											invoc.create[env$ln, sym.create[env$ln, col], opname.literal["lowerbound"], nil]]
		  const ubconst <- constdecl.create[env$ln, sym.create[env$ln, ub], nil,
											invoc.create[env$ln, sym.create[env$ln, col], opname.literal["upperbound"], nil]]
		  const indexvar <- vardecl.create[env$ln, sym.create[env$ln, id], sym.create[env$ln, int], sym.create[env$ln, lb]]

		  const inv : Invoc <- invoc.create[env$ln, sym.create[env$ln, id], opname.literal[">"], seq.singleton[sym.create[env$ln, ub]]]
		  const ex : ExitStat <- exitstat.create[env$ln, inv]
		  var s : Tree <- sseq.create[env$ln]
		  var l : Tree <- sseq.create[env$ln]

		  s.rcons[colconst]
		  s.rcons[lbconst]
		  s.rcons[ubconst]
		  s.rcons[indexvar]

		  l.rcons[ex]
		  l.rcons[constdecl.create[env$ln, yyv[yypvt-5], nil,
								   invoc.create[env$ln, sym.create[env$ln, col], opname.literal["getelement"], seq.singleton[sym.create[env$ln, id]]]]]
		  l.rcons[block.create[env$ln, yyv[yypvt-2], nil, nil]]

		  const inc <- assignstat.create[env$ln, seq.singleton[sym.create[env$ln, id]],
										 seq.singleton[invoc.create[env$ln, sym.create[env$ln, id], opname.literal["+"], seq.singleton[Literal.IntegerL[env$ln, "1"]]]]]
		  l.rcons[inc]
		  l <- loopstat.create[env$ln, l]
		  s.rcons[l]
		  yyval <- block.create[env$ln, s, nil, nil] 

	elseif yym =  129 then 
% #line 662 "em_ecomp.y" 
 yyval <- loopstat.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  130 then 
% #line 666 "em_ecomp.y" 
 yyval <- exitstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  131 then 
% #line 669 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  132 then 
% #line 671 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  133 then 
% #line 675 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  134 then 
% #line 677 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  135 then 
% #line 681 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  136 then 
% #line 683 "em_ecomp.y" 
 yyval <- assignstat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  137 then 
% #line 687 "em_ecomp.y" 
 yyval <- assertstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  138 then 
% #line 691 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["move"]] 

	elseif yym =  139 then 
% #line 693 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["fix"]] 

	elseif yym =  140 then 
% #line 695 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["refix"]] 

	elseif yym =  141 then 
% #line 697 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-0], nil, opname.literal["unfix"]] 

	elseif yym =  142 then 
% #line 701 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  143 then 
% #line 705 "em_ecomp.y" 
 yyval <- returnstat.create[env$ln] 

	elseif yym =  144 then 
% #line 709 "em_ecomp.y" 
 yyval <- returnandfailstat.create[env$ln] 

	elseif yym =  145 then 
% #line 712 "em_ecomp.y" 
 yyval <- seq.create[env$ln] 

	elseif yym =  146 then 
% #line 714 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  147 then 
% #line 716 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  148 then 
% #line 719 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  149 then 
% #line 720 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  150 then 
% #line 723 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  151 then 
% #line 724 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  152 then 
% #line 728 "em_ecomp.y" 
 yyval <- primstat.create[env$ln, yyv[yypvt-9], yyv[yypvt-8], yyv[yypvt-7], yyv[yypvt-5], yyv[yypvt-1]] 

	elseif yym =  153 then 
% #line 731 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  154 then 
% #line 732 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  155 then 
% #line 735 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  156 then 
% #line 736 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  157 then 
% #line 740 "em_ecomp.y" 
 yyval <- waitstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  158 then 
% #line 744 "em_ecomp.y" 
 yyval <- signalstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  159 then 
% #line 748 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  160 then 
% #line 750 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  161 then 
% #line 753 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  162 then 
% #line 754 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  163 then 
% #line 757 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  164 then 
% #line 759 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  165 then 
% #line 761 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], opname.literal["or"], yyv[yypvt-0]]

	elseif yym =  166 then 
% #line 763 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  167 then 
% #line 765 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], opname.literal["and"], yyv[yypvt-0]]

	elseif yym =  168 then 
% #line 767 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-0], (view yyv[yypvt-1] as hasIdent)$id, nil] 

	elseif yym =  169 then 
% #line 769 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  170 then 
% #line 771 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  171 then 
% #line 773 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  172 then 
% #line 775 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  173 then 
% #line 777 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  174 then 
% #line 779 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  175 then 
% #line 781 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  176 then 
% #line 783 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  177 then 
% #line 785 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  178 then 
% #line 787 "em_ecomp.y" 
 yyval <- xview.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  179 then 
% #line 789 "em_ecomp.y" 
 yyval <- xview.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  180 then 
% #line 791 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  181 then 
% #line 793 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  182 then 
% #line 795 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  183 then 
% #line 797 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  184 then 
% #line 799 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  185 then 
% #line 801 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  186 then 
% #line 803 "em_ecomp.y" 

		  const x : Tree <- yyv[yypvt-0]
		  const s <- nameof x

		  if s = "aliteral" and (view x as Literal)$index = IntegerIndex then
		    const il : Literal <- view x as Literal
		    const old : String <- il$str
		    if old[0] = '-' then
		      il$str <- old[1, old.length - 1]
		    else
		      il$str <- "-" || old
		    end if
		    yyval <- x
		  else
		    yyval <- invoc.create[env$ln, yyv[yypvt-0], (view yyv[yypvt-1] as hasIdent)$id, nil]
		  end if
		

	elseif yym =  187 then 
% #line 821 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln, opname.literal["locate"],yyv[yypvt-0]]

	elseif yym =  188 then 
% #line 823 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln, opname.literal["awaiting"],yyv[yypvt-0]]

	elseif yym =  189 then 
% #line 825 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["codeof"],yyv[yypvt-0]]

	elseif yym =  190 then 
% #line 827 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["nameof"],yyv[yypvt-0]]

	elseif yym =  191 then 
% #line 829 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["typeof"],yyv[yypvt-0]]

	elseif yym =  192 then 
% #line 831 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["syntactictypeof"],yyv[yypvt-0]]

	elseif yym =  193 then 
% #line 833 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["islocal"],yyv[yypvt-0]]

	elseif yym =  194 then 
% #line 835 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["isfixed"],yyv[yypvt-0]]

	elseif yym =  195 then 
% #line 837 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["welcome"],yyv[yypvt-0]]

	elseif yym =  196 then 
% #line 840 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  197 then 
% #line 844 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  198 then 
% #line 846 "em_ecomp.y" 
 yyval <- newExp.create[env$ln, yyv[yypvt-0], nil] 

	elseif yym =  199 then 
% #line 848 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-0] as hasIdent)$id, nil] 

	elseif yym =  200 then 
% #line 850 "em_ecomp.y" 
 yyval <- starinvoc.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], nil] 

	elseif yym =  201 then 
% #line 852 "em_ecomp.y" 
 yyval <- questinvoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-0] as hasIdent)$id, nil] 

	elseif yym =  202 then 
% #line 856 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  203 then 
% #line 858 "em_ecomp.y" 
 yyval <- newExp.create[env$ln, yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  204 then 
% #line 860 "em_ecomp.y" 
 yyval <- subscript.create[env$ln, yyv[yypvt-3], yyv[yypvt-1]] 

	elseif yym =  205 then 
% #line 862 "em_ecomp.y" 
 yyval <- fieldsel.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  206 then 
% #line 864 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-3], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  207 then 
% #line 866 "em_ecomp.y" 
 yyval <- starinvoc.create[env$ln, yyv[yypvt-3], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  208 then 
% #line 868 "em_ecomp.y" 
 yyval <- questinvoc.create[env$ln, yyv[yypvt-3], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  209 then 
% #line 872 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  210 then 
% #line 873 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  211 then 
% #line 875 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  212 then 
% #line 878 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  213 then 
% #line 879 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  214 then 
% #line 880 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  215 then 
% #line 883 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  216 then 
% #line 887 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  217 then 
% #line 890 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  218 then 
% #line 891 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  219 then 
% #line 892 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  220 then 
% #line 893 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  221 then 
% #line 894 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  222 then 
% #line 895 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  223 then 
% #line 896 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  224 then 
% #line 897 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  225 then 
% #line 898 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  226 then 
% #line 899 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  227 then 
% #line 900 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  228 then 
% #line 901 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  229 then 
% #line 902 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  230 then 
% #line 903 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  231 then 
% #line 904 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  232 then 
% #line 907 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  233 then 
% #line 908 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  234 then 
% #line 909 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  235 then 
% #line 912 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  236 then 
% #line 913 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  237 then 
% #line 914 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  238 then 
% #line 915 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  239 then 
% #line 919 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  240 then 
% #line 921 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  241 then 
% #line 925 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  242 then 
% #line 927 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  243 then 
% #line 931 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  244 then 
% #line 933 "em_ecomp.y" 
 const t <- arg.create[env$ln, yyv[yypvt-0]]
% If doing move/visit
%		  t$ismove <- true
		  yyval <- t 

	elseif yym =  245 then 
% #line 938 "em_ecomp.y" 
 const t : Arg <- arg.create[env$ln, yyv[yypvt-0]]
% If doing move/visit
%		  t$isvisit <- true
		  yyval <- t 

	elseif yym =  246 then 
% #line 944 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  247 then 
% #line 945 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  248 then 
% #line 946 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  249 then 
% #line 947 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  250 then 
% #line 949 "em_ecomp.y" 
 const t <- Literal.BooleanL[env$ln, true]
		  yyval <- t 

	elseif yym =  251 then 
% #line 952 "em_ecomp.y" 
 const t <- Literal.BooleanL[env$ln, false]
		  yyval <- t 

	elseif yym =  252 then 
% #line 955 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  253 then 
% #line 957 "em_ecomp.y" 
 yyval <- Literal.NilL[env$ln] 

	elseif yym =  254 then 
% #line 958 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  255 then 
% #line 959 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  256 then 
% #line 963 "em_ecomp.y" 
 yyval <- vectorlit.create[env$ln, yyv[yypvt-1], yyv[yypvt-2], nil] 

	elseif yym =  257 then 
% #line 966 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  258 then 
% #line 967 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  259 then 
% #line 968 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  260 then 
% #line 971 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  261 then 
% #line 973 "em_ecomp.y" 
 const x <- yyv[yypvt-0]
		  const y <- view x as OTree
		  y$isImmutable <- true
		  yyval <- yyv[yypvt-0] 

	elseif yym =  262 then 
% #line 980 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  263 then 
% #line 982 "em_ecomp.y" 
 const x <- yyv[yypvt-0]
		  const y <- view x as OTree
		  y$isImmutable <- true
		  yyval <- yyv[yypvt-0] 

	elseif yym =  264 then 
% #line 987 "em_ecomp.y" 

		  const y <- view yyv[yypvt-0] as Monitorable
		  if nameof yyv[yypvt-0] = "anatlit" then
		    env.SemanticError[yyv[yypvt-0]$ln, "Monitored typeobjects don't make sense", nil]
		  end if
		  y$isMonitored <- true
		  yyval <- yyv[yypvt-0]
		

	elseif yym =  265 then 
% #line 996 "em_ecomp.y" 

		  const y <- view yyv[yypvt-0] as OTree
		  if nameof yyv[yypvt-0] = "anatlit" then
		    env.SemanticError[yyv[yypvt-0]$ln, "Welcomable on immutable object.", nil]
		  end if
		  y$isWelcomable <- true
		  yyval <- yyv[yypvt-0]
		

	elseif yym =  266 then 
% #line 1005 "em_ecomp.y" 

		  const y <- view yyv[yypvt-0] as OTree
		  if nameof yyv[yypvt-0] = "anatlit" then
		    env.SemanticError[yyv[yypvt-0]$ln, "Monitored typeobjects don't make sense", nil]
		  end if
		  y$isMonitored <- true
          y$isWelcomable <- true
		  yyval <- yyv[yypvt-0]
		

	elseif yym =  267 then 
% #line 1016 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  268 then 
% #line 1017 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  269 then 
% #line 1018 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  270 then 
% #line 1019 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  271 then 
% #line 1020 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  272 then 
% #line 1021 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  273 then 
% #line 1025 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  274 then 
% #line 1029 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] end if

end yyreduce
end aYYparser
end create
end parsercreator
