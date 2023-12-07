grammar Javanes;

prog: funcoes ;
funcoes: funcao* ;
funcao: 'func' ID '(' params ')' ID bloco ;
param: ID ':' ID ;
params: (param (',' param)*)? ;
bloco: '{' stmt* '}' ;

corpo: bloco | stmt ;
stmt: condicional | declaracao | retorno | chamada ';' | atribuicao | cada | enquanto ;
condicional: SE '(' iexpr ')' corpo (SENAO corpo)? ;
declaracao: SEJA ID '=' iexpr ';' ;
retorno: RETORNA iexpr? ';' ;
chamada: ID '(' args ')';
args: (iexpr (',' iexpr)*)? ;
atribuicao: ID ('=' | ATRARIT) iexpr ';' ;
cada: CADA '(' ID EM iexpr ')' corpo ;
enquanto: ENQUANTO '(' iexpr ')' corpo ;

iexpr: expr ;

expr:
      NUM
    | chamada
    | STRING
    | BOOL
    | ID
    | NOT expr
    | NEG expr
    | AP expr ')'
    | expr EXP expr
    | expr MULMODDIV expr
    | expr OPBIN expr
    | expr ADDSUB expr
    | expr (OPEQ | OPREL) expr
    | expr OPAND expr
    | expr OPOR expr
    | expr OPIMPL expr
    ;

ATR: '=';
OPEQ: '==' | '!=' ;
OPREL: ('>'|'<')'='? ;
OPBIN: '&' | '|' | '^' ;
OPLOG: 'e' | 'ou' | 'nao';
OPAND: '&&' ;
OPOR: '||' ;
OPIMPL: '->' ;
NOT: '!' ;
NEG: '-' ;
AP: '(' ;
FP: ')';

SEJA: 'seja' ;
EM: 'em' ;
SE: 'se' ;
SENAO: 'senao';
ENQUANTO: 'enquanto';
CADA: 'cada' ;
RETORNA: 'retorna' ;

BOOL: 'verdadeiro' | 'falso' ;
STRING: '"' ([^"] | '\\"' | .)*? '"' ;

FUNC: 'func' ;

NUM: '-'? ('0' | [1-9]('_'?[0-9])*)('.'[0-9]('_'?[0-9])*)? ;
ID: [a-zA-Z_][a-zA-Z_0-9]* ;

EXP: '**' ;
ATRARIT: OPARIT '=' ;
MULMODDIV: [*/%] | '//' ;
ADDSUB: [+\-] ;
OPARIT: MULMODDIV | ADDSUB ;

COM: '#' .*? [\n] -> skip ;
WS: [ \r\t\n]+ -> skip ;
ErrorChar: . ; 