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
	const KREWELCOME <- 95
	const KSELF <- 96
	const KSIGNAL <- 97
	const KSUCHTHAT <- 98
	const KSYNTACTICTYPEOF <- 99
	const KTHEN <- 100
	const KTO <- 101
	const KTRUE <- 102
	const KTYPEOBJECT <- 103
	const KTYPEOF <- 104
	const KUNFIX <- 105
	const KUNAVAILABLE <- 106
	const KUNWELCOME <- 107
	const KVAR <- 108
	const KVIEW <- 109
	const KVISIT <- 110
	const KWAIT <- 111
	const KWELCOME <- 112
	const KWHEN <- 113
	const KWHILE <- 114
	const KWHERE <- 115
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
,~1,240
,311,68
,318,68
,321,68
,365,68
,~2,83
,~1,306
,271,275
,~2,274
,~1,317
,314,119
,319,119
,~2,68
,~1,339
,270,136
,278,136
,~2,138
,~1,455
,314,127
,~2,5
,~1,456
,312,125
,313,125
,314,125
,~2,5
}
const YYNPROD <- 276
const YYLAST <- 2120
const yyact %%2119
 <- {
178,504,323,9,384,47,63,412,223,294,
3,244,370,10,119,6,367,148,40,292,
25,21,17,75,4,18,261,309,95,96,
97,98,99,100,101,102,103,104,105,106,
107,293,315,238,216,218,265,245,186,114,
270,255,176,177,195,191,150,241,149,181,
16,15,422,120,45,243,13,19,373,59,
227,152,118,13,512,387,471,127,128,129,
130,131,132,133,134,135,136,137,138,139,
140,141,142,143,144,145,276,511,510,372,
11,430,427,279,234,71,278,74,69,113,
481,509,73,498,226,506,371,507,508,237,
236,479,193,94,480,435,493,17,174,298,
115,116,392,221,194,247,198,70,247,495,
393,232,15,72,92,196,94,200,201,14,
277,90,93,234,12,449,281,69,89,231,
91,417,282,282,266,492,206,92,237,236,
11,188,189,234,173,93,491,267,184,474,
207,208,192,91,205,69,212,476,237,236,
472,206,269,473,268,462,214,460,217,219,
194,458,224,227,19,229,452,219,202,302,
457,454,266,451,450,121,122,123,124,125,
126,234,225,448,8,267,240,248,217,447,
266,414,250,203,204,210,237,236,254,234,
269,442,268,228,13,421,222,420,192,419,
19,409,240,391,237,236,408,272,402,239,
230,382,287,242,233,219,290,379,376,219,
111,108,109,110,374,285,193,252,249,363,
357,356,355,313,305,239,280,259,295,296,
297,258,258,257,257,311,217,247,310,310,
307,288,220,317,284,289,256,256,362,253,
187,215,339,291,211,182,199,312,240,368,
185,175,368,364,378,359,360,361,381,375,
303,308,299,23,365,8,385,112,20,117,
58,7,394,395,396,397,398,57,390,403,
404,239,366,405,406,407,151,401,46,43,
26,30,501,486,416,400,399,466,415,413,
413,340,389,251,428,410,383,380,386,331,
330,329,418,328,411,260,423,327,266,326,
433,325,436,429,120,324,194,234,322,424,
425,267,321,320,319,339,339,333,438,443,
224,437,237,236,434,445,269,332,268,444,
316,413,12,446,300,301,377,314,385,304,
264,263,453,262,459,22,461,275,274,273,
463,464,465,271,358,68,197,286,468,65,
64,469,369,467,283,470,246,235,503,475,
67,477,190,212,66,194,194,213,24,5,
2,1,455,456,339,339,0,484,482,0,
0,0,0,388,0,488,489,10,194,0,
0,487,0,494,0,0,0,339,0,0,
0,0,339,478,505,0,194,194,502,339,
0,0,0,0,513,339,339,0,505,0,
0,334,94,11,0,48,0,0,426,62,
0,0,0,0,0,496,497,0,51,52,
50,49,88,92,82,84,86,80,85,87,
90,93,0,0,83,81,0,89,0,91,
0,0,352,0,0,341,0,0,193,346,
0,0,0,71,0,74,0,0,0,500,
73,338,0,0,0,54,0,343,337,0,
0,0,335,60,0,0,0,0,0,336,
61,342,0,44,56,70,0,0,0,347,
0,72,0,344,0,350,351,354,55,349,
0,0,0,0,53,69,334,345,11,353,
48,0,0,348,62,0,0,0,0,0,
0,0,0,51,52,50,49,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,352,0,0,
341,0,0,193,346,0,0,0,71,0,
74,0,0,0,499,73,338,0,0,0,
54,0,343,337,0,0,0,335,60,0,
0,0,0,0,336,61,342,0,44,56,
70,0,0,0,347,0,72,0,344,0,
350,351,354,55,349,0,0,0,0,53,
69,334,345,11,353,48,0,0,348,62,
0,0,0,0,0,0,0,0,51,52,
50,49,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,352,0,0,341,0,0,193,346,
0,0,0,71,0,74,0,0,0,485,
73,338,0,0,0,54,0,343,337,0,
0,0,335,60,0,0,0,0,0,336,
61,342,0,44,56,70,0,0,0,347,
0,72,0,344,0,350,351,354,55,349,
0,0,0,0,53,69,334,345,11,353,
48,0,0,348,62,0,0,0,0,0,
0,0,0,51,52,50,49,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,352,0,0,
341,0,0,193,346,0,0,0,71,0,
74,0,0,0,432,73,338,0,0,0,
54,0,343,337,0,0,0,335,60,0,
0,0,0,0,336,61,342,0,44,56,
70,0,0,0,347,0,72,0,344,0,
350,351,354,55,349,0,0,0,0,53,
69,334,345,11,353,48,0,0,348,62,
0,0,0,0,0,0,0,0,51,52,
50,49,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,352,0,0,341,0,0,193,346,
0,0,0,71,0,74,0,0,0,0,
73,338,0,0,0,54,0,343,337,0,
0,0,335,60,0,0,0,0,0,336,
61,342,0,44,56,70,0,0,0,347,
0,72,0,344,0,350,351,354,55,349,
0,0,0,0,53,69,0,345,318,353,
334,0,11,348,48,0,0,0,62,0,
0,0,0,0,0,0,0,51,52,50,
49,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,352,0,0,341,0,0,193,346,0,
0,0,71,0,74,0,0,0,0,73,
338,0,0,0,54,0,343,337,0,0,
0,335,60,0,0,0,0,0,336,61,
342,0,44,56,70,0,0,0,347,0,
72,0,344,0,350,351,354,55,349,0,
0,0,0,53,69,11,345,48,353,0,
209,62,348,0,0,0,0,0,0,0,
51,52,50,49,0,0,0,0,0,0,
0,0,0,0,42,0,41,27,0,0,
0,0,0,0,0,0,0,0,0,32,
0,0,0,0,0,71,33,74,0,0,
0,0,73,0,0,0,0,54,0,0,
0,0,0,0,0,60,0,0,38,37,
31,0,61,179,34,44,56,70,0,0,
0,0,0,72,0,0,29,0,0,0,
55,0,0,36,0,0,53,69,35,11,
0,48,0,28,180,62,39,0,0,0,
0,0,0,0,51,52,50,49,0,0,
0,0,0,0,0,0,0,0,42,0,
41,27,0,0,0,0,0,0,0,0,
0,0,0,32,0,0,0,0,0,71,
33,74,0,0,0,0,73,0,0,0,
0,54,0,0,0,0,0,0,0,60,
0,0,38,37,31,0,61,179,34,44,
56,70,0,0,0,0,0,72,0,0,
29,0,0,0,55,0,0,36,0,0,
53,69,35,11,0,48,0,28,180,62,
39,0,0,0,0,0,0,0,51,52,
50,49,0,0,0,0,0,0,0,0,
0,0,42,0,41,27,0,0,0,0,
0,0,0,0,0,0,0,32,0,0,
0,0,0,71,33,74,0,0,0,0,
73,0,0,0,0,54,0,0,0,0,
0,0,0,60,0,0,38,37,31,0,
61,0,34,44,56,70,0,0,0,0,
0,72,0,0,29,0,0,0,55,0,
0,36,0,0,53,69,35,306,0,48,
0,28,0,62,39,0,0,0,0,0,
0,0,51,52,50,49,0,0,0,0,
0,0,0,0,0,0,42,0,41,27,
0,0,0,0,0,0,0,0,0,0,
0,32,0,0,0,0,0,71,33,74,
0,0,0,0,73,0,0,0,0,54,
0,0,0,0,0,0,0,60,0,0,
38,37,31,0,61,0,34,44,56,70,
0,0,0,0,0,72,0,0,29,0,
0,0,55,0,0,36,0,0,53,69,
35,11,0,48,0,28,0,62,39,0,
0,0,0,0,0,0,51,52,50,49,
0,0,0,11,0,48,0,0,0,62,
0,0,0,0,0,0,0,0,51,52,
50,49,0,0,0,0,0,0,0,0,
0,71,0,74,0,0,0,0,73,0,
0,0,0,54,0,0,0,0,0,0,
0,60,0,71,0,74,0,0,61,0,
73,44,56,70,0,54,0,0,0,72,
0,0,0,60,0,0,55,0,0,0,
61,0,53,69,56,70,0,0,94,0,
0,72,0,0,0,0,0,0,55,0,
0,0,0,0,53,69,78,0,88,92,
82,84,86,80,85,87,90,93,94,0,
83,81,76,89,0,91,0,79,0,0,
0,0,0,0,0,0,78,0,88,92,
82,84,86,80,85,87,90,93,0,0,
83,81,76,89,0,91,94,79,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,77,0,78,0,88,92,82,84,
86,80,85,87,90,93,94,439,83,81,
76,89,0,91,0,79,0,0,0,0,
0,0,77,0,78,0,88,92,82,84,
86,80,85,87,90,93,0,147,83,81,
76,89,0,91,94,79,0,0,0,0,
0,0,0,490,0,0,483,0,0,0,
77,0,78,0,88,92,82,84,86,80,
85,87,90,93,431,94,83,81,76,89,
0,91,0,79,0,0,0,0,0,0,
77,0,0,78,0,88,92,82,84,86,
80,85,87,90,93,0,0,83,81,76,
89,94,91,0,79,0,0,441,0,0,
0,0,0,0,0,0,0,0,77,78,
0,88,92,82,84,86,80,85,87,90,
93,0,0,83,81,76,89,94,91,183,
79,0,0,440,0,0,0,0,0,77,
0,0,0,0,0,78,0,88,92,82,
84,86,80,85,87,90,93,0,94,83,
81,76,89,0,91,0,79,0,0,0,
0,0,0,0,0,77,78,0,88,92,
82,84,86,80,85,87,90,93,0,0,
83,81,76,89,94,91,0,79,146,0,
0,0,0,0,0,0,0,0,0,0,
0,77,78,0,88,92,82,84,86,80,
85,87,90,93,172,153,83,81,76,89,
0,91,0,79,0,0,0,0,0,0,
0,0,77,155,0,171,167,156,158,160,
169,159,161,165,168,162,163,157,170,154,
164,94,166,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,77,78,
0,88,92,82,84,86,80,85,87,90,
93,172,153,83,81,0,89,0,91,0,
79,0,0,0,0,0,0,0,0,0,
155,0,0,167,156,158,160,0,159,161,
165,168,162,163,157,0,154,164,0,166

}
const yypact %%513
 <- {
~1000,~1000,24,~1000,~1000,~1000,~1000,~88,~14,~209,
~1000,~1000,~21,~1000,62,~88,55,~1000,~1000,1105,
~1000,~1000,1105,~1000,~1000,1725,~1000,1105,1105,1105,
1105,1105,1105,1105,1105,1105,1105,1105,1105,1105,
4,~1000,~1000,75,1335,~1000,~1000,~1000,1105,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~203,~203,1105,~1000,~1000,~1000,~1000,~1000,~1000,~14,
~14,~14,~14,~14,~14,1725,1105,1105,1105,1105,
1105,1105,1105,1105,1105,1105,1105,1105,1105,1105,
1105,1105,1105,1105,1105,263,1689,1449,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,1725,1756,1335,
1756,63,1001,53,1658,~1000,~1000,~21,~1000,50,
1725,5,5,5,~27,~14,56,1792,1792,263,
263,~136,~136,~136,~136,~136,~136,~136,~136,~136,
~113,~113,~1000,~1000,~1000,~1000,1105,1105,53,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,53,53,~1000,~79,~1000,1725,1105,
1105,~1000,897,~1000,49,1105,~1000,38,~1000,40,
~181,~1000,~143,~1000,~1000,~200,~1000,40,~1000,~88,
1725,1725,~1000,~1000,~1000,~1000,1001,1725,1725,~1000,
~104,~1000,1725,~173,~1000,~1000,~27,~1000,~1000,~1000,
~198,~88,~1000,~14,~1000,~1000,~88,~14,5,48,
~1000,~1000,~88,~1000,1823,1823,~1000,~1000,71,~1000,
~1000,~215,~27,~1000,~107,~1000,1,~1000,~1000,~67,
~1000,~1000,~1000,~1000,~1000,40,~1000,~1000,~1000,40,
~88,~1000,~1000,~1000,~1000,~1000,~222,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~192,~14,~14,~14,
~105,~1000,~39,1209,~1000,~1000,~10,~1000,0,0,
~1000,~1000,~31,685,~1000,~32,~33,~34,~14,~67,
~21,~21,~88,~1000,8,1725,~1000,~87,~27,~256,
~1000,12,~256,~62,~52,~1000,~1000,~1000,~1,~1000,
~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~1000,~1000,~1000,1105,~1000,~185,~117,4,
~138,1105,1105,1105,1105,1105,~1000,~95,1105,1105,
~1000,~1000,1105,1105,1105,~91,~94,1756,~21,~47,
~47,~1000,~1000,1105,~1000,~1000,~153,~1000,~1000,~256,
~1000,~9,~11,~13,~201,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~14,~211,~1000,1487,580,1313,~204,~1000,
~1000,1105,1313,1105,1725,1419,1622,1586,1725,~73,
~143,~1000,~1000,1725,1725,1725,1725,1725,~1000,~1000,
~1000,~47,~1000,~1000,1105,~1000,1725,~88,~1000,~49,
~56,~1000,~1000,~108,~100,~101,~57,1105,~103,~1000,
~1000,~1000,~124,~70,~81,1105,1725,4,~75,1105,
1105,1105,~1000,~1000,~1000,1725,~1000,1105,~252,~1000,
~129,~170,~1000,~1000,~148,794,794,~1000,1105,~184,
1105,1725,1105,1725,1725,1725,~152,~1000,1725,~1000,
~1000,~175,~1000,~1000,~1000,1555,1105,1725,475,~1000,
~1000,~88,~1000,1313,1517,~147,~98,~1000,~128,~135,
1313,~1000,~139,~1000,~1000,~149,370,265,~158,~212,
~225,~166,~1000,~196,~1000,~1000,~1000,~1000,~1000,~1000,
~1000,~1000,~158,~1000
}
const yypgo %%106
 <- {
0,471,470,9,469,15,3,60,25,468,
0,6,145,48,467,5,464,462,55,57,
8,54,460,1,458,50,51,45,27,16,
457,11,47,456,454,452,12,451,450,44,
43,449,447,26,446,445,42,443,439,438,
437,435,7,434,433,431,430,46,19,17,
41,427,426,420,417,407,404,403,402,398,
2,395,391,389,387,383,381,380,379,377,
376,4,374,372,371,18,14,367,365,363,
362,361,360,359,64,59,52,358,71,58,
56,356,53,347,340,339,69
}
const yyr1 %%275
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
57,58,54,55,56,60,60,60,64,65,
65,63,63,63,63,63,63,63,63,63,
63,63,63,63,63,63,63,79,79,61,
61,62,62,80,80,81,82,82,66,68,
68,68,67,69,83,83,84,84,70,70,
71,72,72,72,72,73,77,78,87,87,
87,88,88,20,20,74,89,89,90,90,
75,76,86,86,91,91,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,10,
10,10,10,10,10,10,10,10,10,92,
85,85,85,85,85,93,93,93,93,93,
93,93,94,94,94,26,26,26,99,98,
100,100,100,100,100,100,100,100,100,100,
100,100,100,100,100,101,101,101,59,59,
59,59,95,95,96,96,102,102,102,97,
97,97,97,97,97,97,97,97,97,104,
105,105,105,37,37,103,103,103,106,106,
106,106,106,106,15,12
}
const yyr2 %%275
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
4,3,4,4,4,1,2,2,2,2,
2,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,3,1,
5,1,4,1,3,3,1,2,5,11,
11,7,4,2,1,2,1,3,1,3,
2,4,4,4,2,3,1,1,1,2,
2,1,1,1,1,11,1,1,1,1,
2,2,1,3,1,1,1,3,3,3,
3,2,3,3,3,3,3,3,3,3,
3,4,4,3,3,3,3,3,3,2,
2,2,2,2,2,2,2,2,2,1,
1,2,3,3,3,1,3,4,3,4,
4,4,1,1,3,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,
1,1,2,3,1,3,1,2,2,1,
1,1,1,1,1,1,1,1,1,4,
1,1,2,1,2,1,2,2,1,1,
1,1,1,1,1,1
}
const yychk %%513
 <- {
~1000,~1,~2,~3,0,~4,~5,317,311,~6,
~15,258,~12,258,358,270,~7,~3,~8,271,
276,~15,~51,278,~9,~10,~92,290,366,349,
~91,333,302,309,337,361,356,332,331,369,
~85,289,287,~93,338,~94,~97,~15,260,276,
275,273,274,359,320,353,339,~103,~104,~106,
328,335,264,~11,~38,~41,~16,~22,~45,360,
340,308,346,315,310,~10,293,343,277,298,
284,292,281,291,282,285,283,286,279,294,
287,296,280,288,259,~10,~10,~10,~10,~10,
~10,~10,~10,~10,~10,~10,~10,~10,267,268,
269,266,262,~94,~10,~106,~106,~105,~3,~86,
~10,~12,~12,~12,~12,~12,~12,~10,~10,~10,
~10,~10,~10,~10,~10,~10,~10,~10,~10,~10,
~10,~10,~10,~10,~10,~10,299,358,~59,~99,
~100,~101,~98,259,293,277,281,291,282,285,
283,286,289,290,294,287,296,280,288,284,
292,279,258,~94,~59,258,~96,~102,~10,336,
367,~95,262,261,~7,270,~13,305,~13,~13,
~17,~18,~19,303,~3,~21,~12,~44,~3,260,
~10,~10,~95,~95,~95,263,270,~10,~10,263,
~96,265,~10,~14,~3,273,~39,~3,~27,~3,
262,314,~18,~20,~3,365,314,270,~27,~15,
~102,263,314,~25,326,~30,342,341,~40,~46,
~3,~19,~39,263,~31,~32,~33,336,~15,~21,
~15,~12,~13,261,~15,~26,~98,~99,~100,~26,
314,~43,~54,~55,~56,~57,317,330,347,345,
~25,~47,~5,~48,~49,~50,311,365,321,318,
~40,263,270,~34,303,~8,~42,~3,~27,~27,
~15,~57,~58,~60,~3,~58,~58,~58,321,~21,
~12,~12,314,~32,~12,~10,258,310,~39,~28,
~3,295,~28,314,~61,~46,~63,~3,363,~66,
~67,~68,~69,~70,~71,~72,~73,~74,~75,~76,
~77,~78,~64,~65,256,327,334,323,316,~85,
~84,300,336,322,348,362,304,344,368,354,
350,351,297,364,352,314,314,314,~12,~8,
~8,~8,~15,271,~5,~43,~40,~29,~3,~35,
~36,372,355,324,262,~29,330,~62,~3,319,
~79,~3,262,~80,~81,~10,~60,260,~12,~83,
~3,370,270,278,~10,~10,~10,~10,~10,~58,
~88,~3,353,~10,~10,~10,~10,~10,347,345,
~59,~8,~52,~3,278,~52,~10,314,~36,258,
258,258,263,~31,~58,~58,~12,313,~82,~3,
312,357,314,~70,~8,329,~10,~85,~86,358,
301,301,314,~20,~52,~10,~15,278,279,263,
314,314,263,~81,314,~60,~60,334,271,~53,
278,~10,270,~10,~10,~10,~87,~3,~10,~37,
~11,328,319,363,327,~10,371,~10,~60,273,
276,262,~11,271,~10,314,~89,~3,~6,~70,
306,323,263,261,~70,278,~60,~60,262,314,
314,~90,~3,~24,~23,~15,273,275,276,323,
323,263,270,~23
}
const yydef %%513
 <- {
5,~2,0,2,1,3,4,0,0,7,
20,274,5,275,0,0,0,8,9,0,
6,21,0,74,10,11,166,0,0,0,
0,0,0,0,0,0,0,0,0,0,
199,164,165,200,0,205,212,213,0,249,
250,251,252,253,254,255,256,257,258,265,
0,0,5,268,269,270,271,272,273,0,
0,0,0,0,0,77,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,171,0,0,189,190,
191,192,193,194,195,196,197,198,0,0,
0,0,0,201,0,266,267,5,260,261,
162,55,55,55,5,0,5,167,168,169,
170,172,173,174,175,176,177,178,179,180,
183,184,185,186,187,188,0,0,202,238,
239,240,241,218,220,221,222,223,224,225,
226,227,228,229,230,231,232,233,234,235,
236,237,219,203,204,208,0,244,246,0,
0,206,0,214,0,262,5,0,5,5,
5,14,5,67,68,0,18,5,62,0,
181,182,209,210,211,207,0,247,248,242,
0,259,163,0,28,56,5,65,5,34,
40,0,15,0,153,154,0,0,55,0,
245,243,0,29,0,0,32,33,0,66,
~2,0,5,35,0,37,42,39,13,0,
17,19,5,63,12,5,215,216,217,5,
0,84,85,86,87,88,0,5,5,5,
5,69,70,71,72,73,0,0,0,0,
0,36,40,0,41,16,5,59,5,5,
57,89,0,5,95,0,0,0,0,0,
0,0,0,38,0,44,~2,0,5,5,
45,0,5,0,5,96,97,~2,5,101,
102,103,104,105,106,107,108,109,110,111,
112,113,114,115,116,0,5,0,5,~2,
0,0,0,0,0,0,5,5,0,0,
146,147,0,0,0,0,0,0,0,5,
5,78,58,0,60,61,0,30,48,49,
50,0,0,0,40,31,92,91,121,5,
5,117,0,5,123,0,5,0,0,133,
134,0,0,0,140,0,0,0,144,0,
5,151,152,160,161,98,99,100,93,94,
90,5,82,79,0,75,43,0,51,0,
0,54,46,0,0,0,0,0,0,126,
5,5,0,0,0,0,135,137,139,0,
0,0,145,5,76,80,64,0,0,47,
0,0,118,124,0,~2,~2,132,0,0,
0,5,0,141,142,143,0,148,52,53,
263,0,122,120,128,0,0,81,5,149,
150,5,264,0,0,0,0,156,157,0,
0,131,0,5,5,0,5,5,5,0,
0,0,158,159,26,22,23,24,25,129,
130,155,0,27
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
% #line 152 "em_ecomp.y" 
 yyval <- comp.create[env$ln - 1, env$fileName, nil, nil, yyv[yypvt-1]] env.done[yyval] 

	elseif yym =  2 then 
% #line 156 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  3 then 
% #line 158 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  4 then 
% #line 160 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  5 then 
% #line 163 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  6 then 
% #line 167 "em_ecomp.y" 
 yyval <- xexport.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  7 then 
% #line 170 "em_ecomp.y" 
 yyval <- xexport.create[env$ln, yyv[yypvt-0], nil] 

	elseif yym =  8 then 
% #line 173 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  9 then 
% #line 174 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  10 then 
% #line 178 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  11 then 
% #line 181 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  12 then 
% #line 185 "em_ecomp.y" 
 const a : ATLit <- atlit.create[env$ln, env$fileName, yyv[yypvt-4], yyv[yypvt-2] ]
		  env.checkNames[yyv[yypvt-4], yyv[yypvt-0]]
		  yyval <- a
		  if yyv[yypvt-3] !== nil then
		    a.setBuiltinID[yyv[yypvt-3]]
		  end if 

	elseif yym =  13 then 
% #line 194 "em_ecomp.y" 
 env.checkNames[yyv[yypvt-3], yyv[yypvt-0]]
	      yyval <- recordlit.create[env$ln, env$fileName, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  14 then 
% #line 199 "em_ecomp.y" 
 yyval <- seq.create[env$ln] yyval.rappend[yyv[yypvt-0]] 

	elseif yym =  15 then 
% #line 201 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rappend[yyv[yypvt-0]] 

	elseif yym =  16 then 
% #line 205 "em_ecomp.y" 

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
% #line 227 "em_ecomp.y" 

		  env.checkNames[yyv[yypvt-3], yyv[yypvt-0]]
		  yyval <- enumlit.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]]
		

	elseif yym =  18 then 
% #line 234 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  19 then 
% #line 236 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  20 then 
% #line 240 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  21 then 
% #line 242 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  22 then 
% #line 246 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  23 then 
% #line 248 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  24 then 
% #line 250 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  25 then 
% #line 252 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  26 then 
% #line 256 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  27 then 
% #line 258 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  28 then 
% #line 262 "em_ecomp.y" 
 yyval <- seq.create[env$ln] 

	elseif yym =  29 then 
% #line 264 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] newid.reset 

	elseif yym =  30 then 
% #line 268 "em_ecomp.y" 
 const x : OpSig <- opsig.create[env$ln, (view yyv[yypvt-3] as hasIdent)$id, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]]
		  x$isFunction <- true
		  yyval <- x
		

	elseif yym =  31 then 
% #line 274 "em_ecomp.y" 
 yyval <- opsig.create[env$ln, (view yyv[yypvt-3] as hasIdent)$id, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  32 then 

	elseif yym =  33 then 

	elseif yym =  34 then 
% #line 281 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  35 then 
% #line 283 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  36 then 
% #line 285 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  37 then 
% #line 289 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  38 then 
% #line 291 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  39 then 

	elseif yym =  40 then 

	elseif yym =  41 then 

	elseif yym =  42 then 

	elseif yym =  43 then 
% #line 303 "em_ecomp.y" 

		  const p : Param <- param.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]]
% If doing move/visit
%		  p$isMove <- yyv[yypvt-4] !== nil
		  if yyv[yypvt-3] !== nil then p$isAttached <- true end if
		  yyval <- p
		

	elseif yym =  44 then 
% #line 311 "em_ecomp.y" 

  		  const id <- newid.newid
		  const asym : Sym <- sym.create[env$ln, id]
		  const p : Param <- param.create[env$ln, asym, yyv[yypvt-0]]
% If doing move/visit
%		  p$isMove <- yyv[yypvt-2] !== nil
		  if yyv[yypvt-1] !== nil then p$isAttached <- true end if
		  yyval <- p
		

	elseif yym =  45 then 
% #line 322 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  46 then 
% #line 324 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  47 then 
% #line 326 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  48 then 
% #line 329 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  49 then 
% #line 331 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  50 then 
% #line 335 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  51 then 
% #line 337 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  52 then 
% #line 341 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-2], 1, yyv[yypvt-0]] 

	elseif yym =  53 then 
% #line 343 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-2], 2, yyv[yypvt-0]] 

	elseif yym =  54 then 
% #line 345 "em_ecomp.y" 
 yyval <- wherewidgit.create[env$ln, yyv[yypvt-0], 3, nil] 

	elseif yym =  55 then 
% #line 348 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  56 then 
% #line 350 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  57 then 
% #line 354 "em_ecomp.y" 
 const x : Oblit <- oblit.create[env$ln, env$fileName, yyv[yypvt-5], yyv[yypvt-3], yyv[yypvt-2]]
		  env.checkNames[yyv[yypvt-5], yyv[yypvt-0]]
		  if yyv[yypvt-4] !== nil then
		    x.setBuiltinID[yyv[yypvt-4]]
		  end if
		  yyval <- x 

	elseif yym =  58 then 
% #line 363 "em_ecomp.y" 
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
% #line 382 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  60 then 
% #line 384 "em_ecomp.y" 
 if yyv[yypvt-2] == nil then yyval <- seq.pair[seq.singleton[yyv[yypvt-0]], seq.create[env$ln]] else yyval <- yyv[yypvt-2] yyval[0].rcons[yyv[yypvt-0]] end if 

	elseif yym =  61 then 
% #line 387 "em_ecomp.y" 
 if yyv[yypvt-2] == nil then yyval <- seq.pair[seq.create[env$ln], seq.singleton[yyv[yypvt-0]]] else yyval <- yyv[yypvt-2] yyval[1].rcons[yyv[yypvt-0]] end if 

	elseif yym =  62 then 
% #line 390 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  63 then 
% #line 392 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  64 then 
% #line 396 "em_ecomp.y" 

		  env.checkNames[yyv[yypvt-8], yyv[yypvt-0]]
		  const c <- xclass.create[env$ln, env$fileName, yyv[yypvt-8], yyv[yypvt-7], yyv[yypvt-6], yyv[yypvt-4], yyv[yypvt-3], yyv[yypvt-2]]
		  if yyv[yypvt-5] !== nil then c.setbuiltinid[yyv[yypvt-5]] end if
		  yyval <- c
		

	elseif yym =  65 then 
% #line 405 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  66 then 
% #line 407 "em_ecomp.y" 
 if yyv[yypvt-1] == nil then yyval <- sseq.singleton[yyv[yypvt-0]] else yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] end if 

	elseif yym =  67 then 
% #line 411 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  68 then 
% #line 412 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  69 then 
% #line 416 "em_ecomp.y" 

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
% #line 437 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  71 then 
% #line 438 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  72 then 
% #line 439 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  73 then 
% #line 440 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  74 then 

	elseif yym =  75 then 
% #line 447 "em_ecomp.y" 
 yyval <- fielddecl.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  76 then 
% #line 449 "em_ecomp.y" 
 const f : FieldDecl <- fielddecl.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]]
		  f$isConst <- true
		  yyval <- f 

	elseif yym =  77 then 
% #line 455 "em_ecomp.y" 
 yyval <- constdecl.create[env$ln, yyv[yypvt-3], yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  78 then 
% #line 459 "em_ecomp.y" 
 yyval <- extdecl.create[env$ln, yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  79 then 
% #line 462 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  80 then 
% #line 464 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  81 then 
% #line 468 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  82 then 
% #line 472 "em_ecomp.y" 
 yyval <- env.distribute[vardecl, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  83 then 
% #line 476 "em_ecomp.y" 
 yyval <- seq.create[env$ln]
		  yyval.rcons[nil] yyval.rcons[nil] yyval.rcons[nil] 

	elseif yym =  84 then 
% #line 479 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  85 then 
% #line 481 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[0] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one initially definition is allowed", nil]
		  else
		    yyval.setElement[0, yyv[yypvt-0]]
		  end if
		

	elseif yym =  86 then 
% #line 489 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[1] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one recovery definition is allowed", nil]
		  else
		    yyval.setElement[1, yyv[yypvt-0]]
		  end if
		

	elseif yym =  87 then 
% #line 497 "em_ecomp.y" 
 yyval <- yyv[yypvt-1]
		  if yyval.getElement[2] !== nil then
		    env.SemanticError[yyv[yypvt-0]$ln, "Only one process definition is allowed", nil]
		  else
		    yyval.setElement[2, yyv[yypvt-0]]
		  end if
		

	elseif yym =  88 then 
% #line 507 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  89 then 
% #line 509 "em_ecomp.y" 
 (view yyv[yypvt-0] as OpDef)$isExported <- true yyval <- yyv[yypvt-0] 

	elseif yym =  90 then 
% #line 513 "em_ecomp.y" 
 const sig <- view yyv[yypvt-3] as OpSig
		  env.checkNamesByID[sig$name, (view yyv[yypvt-0] as hasIdent)$id]
		  sig.isInDefinition
		  yyval <- opdef.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  91 then 
% #line 520 "em_ecomp.y" 
 yyval <- block.create[env$ln, yyv[yypvt-2], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  92 then 
% #line 524 "em_ecomp.y" 
 yyval <- initdef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  93 then 
% #line 528 "em_ecomp.y" 
 yyval <- recoverydef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  94 then 
% #line 532 "em_ecomp.y" 
 yyval <- processdef.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  95 then 
% #line 536 "em_ecomp.y" 
 yyval <- sseq.create[env$ln] 

	elseif yym =  96 then 
% #line 538 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  97 then 
% #line 540 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  98 then 
% #line 544 "em_ecomp.y" 
 yyval <- acceptstat.create[env$ln, yyv[yypvt-0] ] 

	elseif yym =  99 then 
% #line 548 "em_ecomp.y" 
 yyval <- unwelcstat.create[env$ln, yyv[yypvt-0], opname.literal["unwelcome"] ] 

	elseif yym =  100 then 
% #line 550 "em_ecomp.y" 
 yyval <- unwelcstat.create[env$ln, yyv[yypvt-0], opname.literal["rewelcome"] ] 

	elseif yym =  101 then 
% #line 553 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  102 then 
% #line 554 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  103 then 
% #line 555 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  104 then 
% #line 556 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  105 then 
% #line 557 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  106 then 
% #line 558 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  107 then 
% #line 559 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  108 then 
% #line 560 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  109 then 
% #line 561 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  110 then 
% #line 562 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  111 then 
% #line 563 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  112 then 
% #line 564 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  113 then 
% #line 565 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  114 then 
% #line 566 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  115 then 
% #line 567 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  116 then 

	elseif yym =  117 then 
% #line 571 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  118 then 
% #line 573 "em_ecomp.y" 
 yyval <- vardecl.create[env$ln, yyv[yypvt-1], sym.create[env$ln, env$itable.Lookup["any", 999]], nil] 

	elseif yym =  119 then 
% #line 576 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  120 then 
% #line 578 "em_ecomp.y" 
 yyval <- xunavail.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  121 then 
% #line 581 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  122 then 
% #line 583 "em_ecomp.y" 
 yyval <- xfailure.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  123 then 
% #line 587 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  124 then 
% #line 589 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  125 then 
% #line 593 "em_ecomp.y" 
 yyval <- ifclause.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  126 then 
% #line 596 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  127 then 
% #line 598 "em_ecomp.y" 
 yyval <- elseclause.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  128 then 
% #line 602 "em_ecomp.y" 
 yyval <- ifstat.create[env$ln, yyv[yypvt-3], yyv[yypvt-2]] 

	elseif yym =  129 then 
% #line 606 "em_ecomp.y" 
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

	elseif yym =  130 then 
% #line 619 "em_ecomp.y" 
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

	elseif yym =  131 then 
% #line 632 "em_ecomp.y" 

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

	elseif yym =  132 then 
% #line 670 "em_ecomp.y" 
 yyval <- loopstat.create[env$ln, yyv[yypvt-2]] 

	elseif yym =  133 then 
% #line 674 "em_ecomp.y" 
 yyval <- exitstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  134 then 
% #line 677 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  135 then 
% #line 679 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  136 then 
% #line 683 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  137 then 
% #line 685 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  138 then 
% #line 689 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  139 then 
% #line 691 "em_ecomp.y" 
 yyval <- assignstat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  140 then 
% #line 695 "em_ecomp.y" 
 yyval <- assertstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  141 then 
% #line 699 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["move"]] 

	elseif yym =  142 then 
% #line 701 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["fix"]] 

	elseif yym =  143 then 
% #line 703 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], opname.literal["refix"]] 

	elseif yym =  144 then 
% #line 705 "em_ecomp.y" 
 yyval <- movestat.create[env$ln, yyv[yypvt-0], nil, opname.literal["unfix"]] 

	elseif yym =  145 then 
% #line 709 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  146 then 
% #line 713 "em_ecomp.y" 
 yyval <- returnstat.create[env$ln] 

	elseif yym =  147 then 
% #line 717 "em_ecomp.y" 
 yyval <- returnandfailstat.create[env$ln] 

	elseif yym =  148 then 
% #line 720 "em_ecomp.y" 
 yyval <- seq.create[env$ln] 

	elseif yym =  149 then 
% #line 722 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  150 then 
% #line 724 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  151 then 
% #line 727 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  152 then 
% #line 728 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  153 then 
% #line 731 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  154 then 
% #line 732 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  155 then 
% #line 736 "em_ecomp.y" 
 yyval <- primstat.create[env$ln, yyv[yypvt-9], yyv[yypvt-8], yyv[yypvt-7], yyv[yypvt-5], yyv[yypvt-1]] 

	elseif yym =  156 then 
% #line 739 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  157 then 
% #line 740 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  158 then 
% #line 743 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  159 then 
% #line 744 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  160 then 
% #line 748 "em_ecomp.y" 
 yyval <- waitstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  161 then 
% #line 752 "em_ecomp.y" 
 yyval <- signalstat.create[env$ln, yyv[yypvt-0]] 

	elseif yym =  162 then 
% #line 756 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  163 then 
% #line 758 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  164 then 
% #line 761 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  165 then 
% #line 762 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  166 then 
% #line 765 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  167 then 
% #line 767 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  168 then 
% #line 769 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], opname.literal["or"], yyv[yypvt-0]]

	elseif yym =  169 then 
% #line 771 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  170 then 
% #line 773 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], opname.literal["and"], yyv[yypvt-0]]

	elseif yym =  171 then 
% #line 775 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-0], (view yyv[yypvt-1] as hasIdent)$id, nil] 

	elseif yym =  172 then 
% #line 777 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  173 then 
% #line 779 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  174 then 
% #line 781 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  175 then 
% #line 783 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  176 then 
% #line 785 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  177 then 
% #line 787 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  178 then 
% #line 789 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  179 then 
% #line 791 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  180 then 
% #line 793 "em_ecomp.y" 
 yyval <- exp.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  181 then 
% #line 795 "em_ecomp.y" 
 yyval <- xview.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  182 then 
% #line 797 "em_ecomp.y" 
 yyval <- xview.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  183 then 
% #line 799 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  184 then 
% #line 801 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  185 then 
% #line 803 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  186 then 
% #line 805 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  187 then 
% #line 807 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  188 then 
% #line 809 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-1] as hasIdent)$id, seq.singleton[yyv[yypvt-0]]] 

	elseif yym =  189 then 
% #line 811 "em_ecomp.y" 

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
		

	elseif yym =  190 then 
% #line 829 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln, opname.literal["locate"],yyv[yypvt-0]]

	elseif yym =  191 then 
% #line 831 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln, opname.literal["awaiting"],yyv[yypvt-0]]

	elseif yym =  192 then 
% #line 833 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["codeof"],yyv[yypvt-0]]

	elseif yym =  193 then 
% #line 835 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["nameof"],yyv[yypvt-0]]

	elseif yym =  194 then 
% #line 837 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["typeof"],yyv[yypvt-0]]

	elseif yym =  195 then 
% #line 839 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["syntactictypeof"],yyv[yypvt-0]]

	elseif yym =  196 then 
% #line 841 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["islocal"],yyv[yypvt-0]]

	elseif yym =  197 then 
% #line 843 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["isfixed"],yyv[yypvt-0]]

	elseif yym =  198 then 
% #line 845 "em_ecomp.y" 
 yyval <- unaryexp.create[env$ln,opname.literal["welcome"],yyv[yypvt-0]]

	elseif yym =  199 then 
% #line 848 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  200 then 
% #line 852 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  201 then 
% #line 854 "em_ecomp.y" 
 yyval <- newExp.create[env$ln, yyv[yypvt-0], nil] 

	elseif yym =  202 then 
% #line 856 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-0] as hasIdent)$id, nil] 

	elseif yym =  203 then 
% #line 858 "em_ecomp.y" 
 yyval <- starinvoc.create[env$ln, yyv[yypvt-2], yyv[yypvt-0], nil] 

	elseif yym =  204 then 
% #line 860 "em_ecomp.y" 
 yyval <- questinvoc.create[env$ln, yyv[yypvt-2], (view yyv[yypvt-0] as hasIdent)$id, nil] 

	elseif yym =  205 then 
% #line 864 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  206 then 
% #line 866 "em_ecomp.y" 
 yyval <- newExp.create[env$ln, yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  207 then 
% #line 868 "em_ecomp.y" 
 yyval <- subscript.create[env$ln, yyv[yypvt-3], yyv[yypvt-1]] 

	elseif yym =  208 then 
% #line 870 "em_ecomp.y" 
 yyval <- fieldsel.create[env$ln, yyv[yypvt-2], yyv[yypvt-0]] 

	elseif yym =  209 then 
% #line 872 "em_ecomp.y" 
 yyval <- invoc.create[env$ln, yyv[yypvt-3], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  210 then 
% #line 874 "em_ecomp.y" 
 yyval <- starinvoc.create[env$ln, yyv[yypvt-3], yyv[yypvt-1], yyv[yypvt-0]] 

	elseif yym =  211 then 
% #line 876 "em_ecomp.y" 
 yyval <- questinvoc.create[env$ln, yyv[yypvt-3], (view yyv[yypvt-1] as hasIdent)$id, yyv[yypvt-0]] 

	elseif yym =  212 then 
% #line 880 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  213 then 
% #line 881 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  214 then 
% #line 883 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  215 then 
% #line 886 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  216 then 
% #line 887 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  217 then 
% #line 888 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  218 then 
% #line 891 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  219 then 
% #line 895 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  220 then 
% #line 898 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  221 then 
% #line 899 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  222 then 
% #line 900 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  223 then 
% #line 901 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  224 then 
% #line 902 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  225 then 
% #line 903 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  226 then 
% #line 904 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  227 then 
% #line 905 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  228 then 
% #line 906 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  229 then 
% #line 907 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  230 then 
% #line 908 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  231 then 
% #line 909 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  232 then 
% #line 910 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  233 then 
% #line 911 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  234 then 
% #line 912 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  235 then 
% #line 915 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  236 then 
% #line 916 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  237 then 
% #line 917 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  238 then 
% #line 920 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  239 then 
% #line 921 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  240 then 
% #line 922 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  241 then 
% #line 923 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  242 then 
% #line 927 "em_ecomp.y" 
 yyval <- nil 

	elseif yym =  243 then 
% #line 929 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  244 then 
% #line 933 "em_ecomp.y" 
 yyval <- seq.singleton[yyv[yypvt-0]] 

	elseif yym =  245 then 
% #line 935 "em_ecomp.y" 
 yyval <- yyv[yypvt-2] yyval.rcons[yyv[yypvt-0]] 

	elseif yym =  246 then 
% #line 939 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  247 then 
% #line 941 "em_ecomp.y" 
 const t <- arg.create[env$ln, yyv[yypvt-0]]
% If doing move/visit
%		  t$ismove <- true
		  yyval <- t 

	elseif yym =  248 then 
% #line 946 "em_ecomp.y" 
 const t : Arg <- arg.create[env$ln, yyv[yypvt-0]]
% If doing move/visit
%		  t$isvisit <- true
		  yyval <- t 

	elseif yym =  249 then 
% #line 952 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  250 then 
% #line 953 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  251 then 
% #line 954 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  252 then 
% #line 955 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  253 then 
% #line 957 "em_ecomp.y" 
 const t <- Literal.BooleanL[env$ln, true]
		  yyval <- t 

	elseif yym =  254 then 
% #line 960 "em_ecomp.y" 
 const t <- Literal.BooleanL[env$ln, false]
		  yyval <- t 

	elseif yym =  255 then 
% #line 963 "em_ecomp.y" 
 yyval <- selflit.create[env$ln] 

	elseif yym =  256 then 
% #line 965 "em_ecomp.y" 
 yyval <- Literal.NilL[env$ln] 

	elseif yym =  257 then 
% #line 966 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  258 then 
% #line 967 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  259 then 
% #line 971 "em_ecomp.y" 
 yyval <- vectorlit.create[env$ln, yyv[yypvt-1], yyv[yypvt-2], nil] 

	elseif yym =  260 then 
% #line 974 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  261 then 
% #line 975 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  262 then 
% #line 976 "em_ecomp.y" 
 yyval <- yyv[yypvt-1] 

	elseif yym =  263 then 
% #line 979 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  264 then 
% #line 981 "em_ecomp.y" 
 const x <- yyv[yypvt-0]
		  const y <- view x as OTree
		  y$isImmutable <- true
		  yyval <- yyv[yypvt-0] 

	elseif yym =  265 then 
% #line 988 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  266 then 
% #line 990 "em_ecomp.y" 
 const x <- yyv[yypvt-0]
		  const y <- view x as OTree
		  y$isImmutable <- true
		  yyval <- yyv[yypvt-0] 

	elseif yym =  267 then 
% #line 995 "em_ecomp.y" 

		  const y <- view yyv[yypvt-0] as Monitorable
		  if nameof yyv[yypvt-0] = "anatlit" then
		    env.SemanticError[yyv[yypvt-0]$ln, "Monitored typeobjects don't make sense", nil]
		  end if
		  y$isMonitored <- true
		  yyval <- yyv[yypvt-0]
		

	elseif yym =  268 then 
% #line 1005 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  269 then 
% #line 1006 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  270 then 
% #line 1007 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  271 then 
% #line 1008 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  272 then 
% #line 1009 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  273 then 
% #line 1010 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  274 then 
% #line 1014 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] 

	elseif yym =  275 then 
% #line 1018 "em_ecomp.y" 
 yyval <- yyv[yypvt-0] end if

end yyreduce
end aYYparser
end create
end parsercreator
