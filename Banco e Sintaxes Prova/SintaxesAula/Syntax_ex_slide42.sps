****** ITEM 1.
DATASET ACTIVATE DataSet1.
* Define Variable Properties.
*ID.
VARIABLE LABELS  ID 'Numero do paciente'.
*EDUCA.
VARIABLE LABELS  EDUCA 'Nível de instrução'.
VALUE LABELS EDUCA
  1 'Nenhum'
  2 'Primeiro Grau Incompleto'
  3 'Primeiro Grau Completo'
  4 'Segundo Grau Completo'
  5 'Curso Técnico'.
*PESO.
VARIABLE LABELS  PESO 'Peso (em kg)'.
*ALTURA.
VARIABLE LABELS  ALTURA 'Altura (em cm)'.
*IDADE.
VARIABLE LABELS  IDADE 'Idade (em anos)'.
*FUMO.
VARIABLE LABELS  FUMO 'Hábito de Fumar'.
VALUE LABELS FUMO
  0 'Não Fumante'
  1 'Fumante'.
*ATIVIDADE.
VARIABLE LABELS  ATIVIDADE 'Atividade Física'.
VALUE LABELS ATIVIDADE
  1 'Sedentário'
  2 'Moderada'.
*GLICOSE.
VARIABLE LABELS  GLICOSE 'Nível de Glicose (em mg%)'.
*COLESTEROL.
VARIABLE LABELS  COLESTEROL 'Nível de Colesterol Sérico (em mg%)'.
*SISTOLICA.
VARIABLE LABELS  SISTOLICA 'Pressão sistólica (em mmHg)'.
EXECUTE.



****** ITEM 2.

FREQUENCIES VARIABLES=ID EDUCA PESO ALTURA IDADE FUMO ATIVIDADE GLICOSE COLESTEROL SISTOLICA
  /ORDER=ANALYSIS.



******* ITEM 3.
* Define Variable Properties.
*PESO.
MISSING VALUES PESO(999).
EXECUTE.

* Identify Duplicate Cases.
SORT CASES BY ID(A) EDUCA(A) PESO(A) ALTURA(A) IDADE(A) FUMO(A) ATIVIDADE(A) GLICOSE(A) 
    COLESTEROL(A) SISTOLICA(A).
MATCH FILES
  /FILE=*
  /BY ID EDUCA PESO ALTURA IDADE FUMO ATIVIDADE GLICOSE COLESTEROL SISTOLICA
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.

* Identify Duplicate Cases.
SORT CASES BY ID(A) EDUCA(A) ALTURA(A) IDADE(A) FUMO(A) ATIVIDADE(A) GLICOSE(A) COLESTEROL(A) 
    SISTOLICA(A).
MATCH FILES
  /FILE=*
  /BY ID EDUCA ALTURA IDADE FUMO ATIVIDADE GLICOSE COLESTEROL SISTOLICA
 /DROP = PrimaryLast  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.
